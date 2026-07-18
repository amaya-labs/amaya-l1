#!/usr/bin/env bash
# Amaya L1 — read-only local preflight check
# Does not install packages, alter PATH, start/stop services, or deploy blockchains.

set -euo pipefail

PASS_COUNT=0
WARN_COUNT=0
FAIL_COUNT=0

pass() {
  PASS_COUNT=$((PASS_COUNT + 1))
  printf '  [PASS] %s\n' "$1"
}

warn() {
  WARN_COUNT=$((WARN_COUNT + 1))
  printf '  [WARNING] %s\n' "$1"
}

fail() {
  FAIL_COUNT=$((FAIL_COUNT + 1))
  printf '  [FAIL] %s\n' "$1"
}

section() {
  printf '\n== %s ==\n' "$1"
}

is_port_in_use() {
  local port="$1"
  if command -v lsof >/dev/null 2>&1; then
    lsof -nP -iTCP:"${port}" -sTCP:LISTEN >/dev/null 2>&1
    return $?
  fi
  if command -v nc >/dev/null 2>&1; then
    nc -z 127.0.0.1 "${port}" >/dev/null 2>&1
    return $?
  fi
  return 2
}

resolve_avalanche_cli() {
  if command -v avalanche >/dev/null 2>&1; then
    command -v avalanche
    return 0
  fi
  if [[ -x "${HOME}/bin/avalanche" ]]; then
    printf '%s\n' "${HOME}/bin/avalanche"
    return 0
  fi
  return 1
}

printf 'Amaya L1 preflight (read-only)\n'
printf 'Repository checks only — no installs, no service changes, no deployments.\n'

section "Operating system"
OS_NAME="$(uname -s 2>/dev/null || echo unknown)"
OS_ARCH="$(uname -m 2>/dev/null || echo unknown)"
printf '  Detected OS: %s\n' "${OS_NAME}"
printf '  Detected architecture: %s\n' "${OS_ARCH}"
case "${OS_NAME}" in
  Darwin|Linux)
    pass "Supported OS family for Local Alpha operator tooling (${OS_NAME})"
    ;;
  *)
    warn "Unrecognized OS (${OS_NAME}); scripts target macOS/Linux"
    ;;
esac

section "Disk space"
if command -v df >/dev/null 2>&1; then
  # Portable-ish: show available space on the current filesystem without noisy inodes.
  DF_LINE="$(df -h . 2>/dev/null | awk 'NR==2 {print $4}')"
  if [[ -n "${DF_LINE}" ]]; then
    printf '  Available on current volume: %s\n' "${DF_LINE}"
    pass "Disk space information available"
  else
    warn "Could not parse disk space for the current directory"
  fi
else
  warn "df not available; skipped disk space check"
fi

section "Required / recommended tools"
if command -v git >/dev/null 2>&1; then
  pass "Git found ($(git --version 2>/dev/null | head -n1))"
else
  fail "Git not found"
fi

if command -v curl >/dev/null 2>&1; then
  pass "curl found"
else
  fail "curl not found"
fi

if command -v jq >/dev/null 2>&1; then
  pass "jq found"
else
  warn "jq not found (optional for this milestone)"
fi

section "Avalanche CLI"
AVALANCHE_BIN=""
if AVALANCHE_BIN="$(resolve_avalanche_cli)"; then
  pass "Avalanche CLI located"
  # Print version only; do not dump config directories or keys.
  if VERSION_OUT="$("${AVALANCHE_BIN}" --version 2>/dev/null || "${AVALANCHE_BIN}" version 2>/dev/null || true)"; then
    if [[ -n "${VERSION_OUT}" ]]; then
      # First non-empty line only — avoid noisy multi-line dumps.
      VERSION_LINE="$(printf '%s\n' "${VERSION_OUT}" | awk 'NF {print; exit}')"
      printf '  Avalanche CLI version: %s\n' "${VERSION_LINE}"
      pass "Avalanche CLI version readable"
    else
      warn "Avalanche CLI found but version output was empty"
    fi
  else
    warn "Avalanche CLI found but version could not be determined"
  fi
  # Indicate whether resolution used fallback without printing home path details beyond requirement.
  if command -v avalanche >/dev/null 2>&1; then
    printf '  Resolution: on PATH\n'
  else
    printf '  Resolution: fallback \$HOME/bin/avalanche\n'
  fi
else
  fail "Avalanche CLI not found on PATH or at \$HOME/bin/avalanche"
fi

section "Common Avalanche local Primary Network / API ports (9650 / 9651)"
printf '  Note: 9650/9651 are common Avalanche local Primary Network/API ports.\n'
printf '  They are NOT the guaranteed Amaya L1 RPC port.\n'
printf '  The Amaya L1 validator RPC may use a dynamically assigned localhost port\n'
printf '  and is known only after a successful deployment (discover from deploy output).\n'
printf '  Port layout may change between Avalanche CLI versions.\n'
for port in 9650 9651; do
  set +e
  is_port_in_use "${port}"
  PORT_STATUS=$?
  set -e
  if [[ "${PORT_STATUS}" -eq 0 ]]; then
    warn "Primary Network/API port ${port} appears to be in use (listener detected)"
  elif [[ "${PORT_STATUS}" -eq 2 ]]; then
    warn "Could not determine whether port ${port} is in use (no lsof/nc)"
  else
    pass "Primary Network/API port ${port} does not appear to be listening locally"
  fi
done

section "Docker (optional)"
if command -v docker >/dev/null 2>&1; then
  pass "Docker found (optional for Local Alpha)"
else
  warn "Docker not found (optional for this milestone)"
fi

section "Summary"
printf '  PASS: %s\n' "${PASS_COUNT}"
printf '  WARNING: %s\n' "${WARN_COUNT}"
printf '  FAIL: %s\n' "${FAIL_COUNT}"

if [[ "${FAIL_COUNT}" -gt 0 ]]; then
  printf '\nResult: FAIL\n'
  exit 1
fi

if [[ "${WARN_COUNT}" -gt 0 ]]; then
  printf '\nResult: PASS WITH WARNINGS\n'
  exit 0
fi

printf '\nResult: PASS\n'
exit 0
