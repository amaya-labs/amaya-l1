# Contributing to Amaya L1

Thank you for helping build **Amaya L1** — Infrastructure for a Moving World.

This repository holds production-grade **infrastructure documentation, declarative config, and read-only operator scripts**. It is not an application monorepo and must not accumulate secrets.

**TAMAYA is a valueless testnet asset used only for gas and network testing.**

## Ground rules

1. Production-ready changes only — no temporary insecure shortcuts.
2. Never modify sibling repositories (including `moveplus_mainapp_web3`) from Amaya L1 work.
3. Never commit secrets (see [SECURITY.md](SECURITY.md)).
4. Ask before Avalanche create/deploy/reset/clean, validator changes, destructive commands, or Git push.
5. Keep `local-alpha`, `fuji`, and `mainnet` configurations isolated.
6. Do not introduce early bridges, public token-launch platforms, or unrestricted third-party fungible-token functionality.

## Branch and commit conventions

- Branch from `main` using a short, descriptive name:
  - `docs/...` for documentation
  - `ops/...` for runbooks and operator tooling
  - `config/...` for declarative non-secret specs
  - `fix/...` or `chore/...` as appropriate
- Write commit messages that explain **why**, in present tense, concise (1–2 sentences).
- Do not commit generated node databases, keystores, or `~/.avalanche-cli` copies.
- Do not use commit messages that imply token sales, investment, or monetary value for TAMAYA.

## Review expectations

- Another operator/reviewer should check security impact for any change touching config, scripts, or deployment docs.
- Prefer small, reviewable diffs.
- CI or local validation: run `make validate` (and `make preflight` when operator tooling changed).
- Reviewers must reject secrets, sibling-repo edits, and undeclared destructive procedures.

## No secrets

Forbidden in PRs and commits:

- `.env` (use `.env.example` placeholders only)
- Private keys, mnemonics, keystores, PEM keys, cloud credentials
- Validator staking/TLS private material
- Screenshots containing phrases, private keys, or credentials

If unsure whether something is secret, **do not commit it**.

## Documentation updates

Update docs when you change:

| Change type | Also update |
|---|---|
| Architecture or policy | ADRs and/or `docs/architecture/overview.md` |
| Operator procedure | Relevant runbook under `docs/operations/` |
| Integration posture | `docs/integrations/` |
| Security practice | `SECURITY.md` and key-separation docs |
| Repo layout / scripts | `README.md` structure section if needed |

## Deployment-affecting changes

Any change that can affect create/deploy/runtime behavior requires, in the PR description:

1. **Runbook impact** — which phases/docs change
2. **Verification plan** — how operators confirm success (read-only checks preferred)
3. **Rollback plan** — how to reverse or halt safely
4. **Security impact** — roles, keys, and blast radius

Mark Avalanche create/deploy steps as **approval required** until explicitly authorized.

## Scripts

- Scripts in `scripts/` must remain **read-only and non-destructive** unless a future ADR and review explicitly expand scope.
- New scripts should use `set -euo pipefail`, avoid printing secrets, and be checked with `bash -n` via `make validate`.

## Pull requests

- Summarize intent and risk.
- Link related ADRs or runbook sections.
- Confirm `make validate` was run.
- Do not request merge if secrets are present in the diff.

## Related

- [SECURITY.md](SECURITY.md)
- [docs/operations/local-alpha-runbook.md](docs/operations/local-alpha-runbook.md)
- [README.md](README.md)
