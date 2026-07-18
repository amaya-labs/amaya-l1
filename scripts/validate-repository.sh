#!/usr/bin/env bash
# Amaya L1 — read-only repository structure validator
# Does not modify or delete files. Does not print suspected secret contents.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT}"

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

REQUIRED_PATHS=(
  ".cursor/rules/amaya-l1.mdc"
  "config/local-alpha/README.md"
  "config/local-alpha/network-spec.yaml"
  "config/fuji/README.md"
  "config/mainnet/README.md"
  "deployments/local-alpha/.gitkeep"
  "deployments/fuji/.gitkeep"
  "deployments/mainnet/.gitkeep"
  "docs/architecture/overview.md"
  "docs/decisions/ADR-001-permissioned-avalanche-l1.md"
  "docs/decisions/ADR-002-proof-of-authority.md"
  "docs/decisions/ADR-003-tamaya-testnet-asset.md"
  "docs/decisions/ADR-004-no-early-bridges.md"
  "docs/integrations/move-plus.md"
  "docs/integrations/onetap.md"
  "docs/operations/local-alpha-runbook.md"
  "docs/operations/key-separation.md"
  "docs/operations/deployment-records.md"
  "docs/operations/incident-response.md"
  "scripts/preflight.sh"
  "scripts/validate-repository.sh"
  ".editorconfig"
  ".env.example"
  ".gitattributes"
  ".gitignore"
  "CONTRIBUTING.md"
  "Makefile"
  "README.md"
  "SECURITY.md"
)

printf 'Amaya L1 repository validation (read-only)\n'
printf 'Root: repository root (path omitted from detail lines)\n'

section "Required paths"
for rel in "${REQUIRED_PATHS[@]}"; do
  if [[ -e "${ROOT}/${rel}" ]]; then
    pass "Found ${rel}"
  else
    fail "Missing ${rel}"
  fi
done

section "Shell script syntax"
if command -v bash >/dev/null 2>&1; then
  while IFS= read -r -d '' script; do
    rel="${script#"${ROOT}"/}"
    if bash -n "${script}"; then
      pass "bash -n OK: ${rel}"
    else
      fail "bash -n failed: ${rel}"
    fi
  done < <(find "${ROOT}/scripts" -type f -name '*.sh' -print0 2>/dev/null)
else
  fail "bash not available for syntax checks"
fi

section "Secret-like filenames"
# Scan working tree names only; never open or print file contents.
SUSPECT_FOUND=0
while IFS= read -r -d '' file; do
  rel="${file#"${ROOT}"/}"
  # Skip .git internals
  case "${rel}" in
    .git|/*|.git/*) continue ;;
  esac
  base="$(basename "${rel}")"
  lower="$(printf '%s' "${rel}" | tr '[:upper:]' '[:lower:]')"
  suspect=0
  case "${lower}" in
    *.pem|*.p12|*.pfx|*.jks|*.keystore|*.key)
      suspect=1
      ;;
  esac
  case "${base}" in
    .env|.env.*|id_rsa|id_ecdsa|id_ed25519)
      if [[ "${base}" != ".env.example" ]]; then
        suspect=1
      fi
      ;;
  esac
  if printf '%s' "${lower}" | grep -Eq 'secret|credential|keystore|mnemonic|seedphrase|seed\.txt|private.?key|staking.?key|tls.?key'; then
    # Allow documentation filenames that discuss secrets without being secrets.
    case "${lower}" in
      *.md|*.mdc|*.example|*.yaml|*.yml|makefile|.gitignore|.gitattributes|.editorconfig)
        ;;
      *)
        suspect=1
        ;;
    esac
  fi
  if [[ "${suspect}" -eq 1 ]]; then
    SUSPECT_FOUND=1
    warn "Secret-like filename present: ${rel}"
  fi
done < <(find "${ROOT}" -path "${ROOT}/.git" -prune -o -type f -print0 2>/dev/null)

if [[ "${SUSPECT_FOUND}" -eq 0 ]]; then
  pass "No secret-like filenames detected in the working tree"
fi

section "Git tracked-file scan"
if command -v git >/dev/null 2>&1 && git -C "${ROOT}" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  # If there are no commits yet, ls-files may still list staged files; either way is fine.
  TRACKED_SUSPECT=0
  while IFS= read -r rel; do
    [[ -z "${rel}" ]] && continue
    lower="$(printf '%s' "${rel}" | tr '[:upper:]' '[:lower:]')"
    base="$(basename "${rel}")"
    suspect=0
    case "${lower}" in
      *.pem|*.p12|*.pfx|*.jks|*.keystore|*.key)
        suspect=1
        ;;
    esac
    case "${base}" in
      .env|.env.*|id_rsa|id_ecdsa|id_ed25519)
        if [[ "${base}" != ".env.example" ]]; then
          suspect=1
        fi
        ;;
    esac
    if printf '%s' "${lower}" | grep -Eq 'secret|credential|keystore|mnemonic|seedphrase|private.?key|staking.?key|tls.?key'; then
      case "${lower}" in
        *.md|*.mdc|*.example|*.yaml|*.yml)
          ;;
        *)
          suspect=1
          ;;
      esac
    fi
    if [[ "${suspect}" -eq 1 ]]; then
      TRACKED_SUSPECT=1
      warn "Tracked secret-like path: ${rel}"
    fi
  done < <(git -C "${ROOT}" ls-files -c --cached --others --exclude-standard 2>/dev/null || true)

  if [[ "${TRACKED_SUSPECT}" -eq 0 ]]; then
    pass "No secret-like paths in Git file listing"
  fi
else
  warn "Git unavailable or not a repository; skipped tracked-file scan"
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
