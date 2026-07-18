# Amaya L1 Makefile — operator helpers (read-only targets)
# Never embed create/deploy/clean Avalanche commands here.

.PHONY: help preflight validate status

help:
	@printf '%s\n' \
		'Amaya L1 — available targets' \
		'' \
		'  make help       Show this help' \
		'  make preflight  Read-only Local Alpha operator preflight' \
		'  make validate   Read-only repository structure validation' \
		'  make status     Git status + Avalanche CLI version (non-secret)' \
		'' \
		'These targets do not install software, start services, or deploy blockchains.'

preflight:
	@bash scripts/preflight.sh

validate:
	@bash scripts/validate-repository.sh

status:
	@printf '== Git status ==\n'
	@git status
	@printf '\n== Avalanche CLI ==\n'
	@if command -v avalanche >/dev/null 2>&1; then \
		avalanche --version 2>/dev/null || avalanche version 2>/dev/null || printf 'avalanche found but version unavailable\n'; \
	elif [ -x "$$HOME/bin/avalanche" ]; then \
		"$$HOME/bin/avalanche" --version 2>/dev/null || "$$HOME/bin/avalanche" version 2>/dev/null || printf 'fallback avalanche binary found but version unavailable\n'; \
	else \
		printf 'Avalanche CLI not found on PATH or at $$HOME/bin/avalanche\n'; \
	fi
