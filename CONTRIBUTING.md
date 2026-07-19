# Contributing to Amaya L1

Amaya L1 is currently in an early research, documentation, and proof-of-concept stage.

Contributions should remain focused, secure, clearly documented, production-ready in quality, and aligned with the current project scope.

**TAMAYA is a valueless testnet asset used only for gas and network testing.**

## Current Scope

The initial Amaya L1 scope includes:

- Amaya L1 infrastructure (permissioned Avalanche L1 · Subnet-EVM)
- Validators and RPC nodes
- Amaya Testnet
- TAMAYA test transactions
- Move+
- Move+ Marketplace
- OneTap transport and parking
- Payment and settlement research
- Government document and payment-proof demonstrations (synthetic research/demo only)

**Out of scope for early phases:**

- Project Agilus
- Public token-launch platforms
- Unrestricted third-party fungible tokens
- Early bridges
- Exchange, lending, remittance, or public financial-service products operated by Amaya as licensed services

## Ground Rules

1. Production-ready changes only — no temporary insecure shortcuts.
2. Never modify sibling repositories (including `moveplus_mainapp_web3`) from Amaya L1 work.
3. Never commit secrets (see [SECURITY.md](SECURITY.md)).
4. Ask before Avalanche create/deploy/reset/clean, validator changes, destructive commands, or Git push.
5. Keep `local-alpha`, `fuji`, and `mainnet` configurations isolated.
6. Do not weaken the permissioned-network policy.

## Before Contributing

Before making a major change:

1. Open an issue describing the proposed change.
2. Explain the problem being solved.
3. Identify affected files or components.
4. Include relevant official Avalanche documentation.
5. Describe security, compatibility, verification, and rollback considerations.

Small documentation corrections may be submitted directly through a pull request.

## Contribution Rules

- Keep pull requests focused on one clear change.
- Do not commit secrets or credentials.
- Do not include production IP addresses or internal infrastructure details.
- Use placeholders in public configuration examples (`.env.example` only for env templates).
- Clearly label experimental and untested procedures.
- Do not claim government approval, partnerships, audits, funding, or production readiness without evidence.
- Do not introduce real-money functionality into testnet code.
- Verify infrastructure commands against current official Avalanche documentation.
- Include recovery or rollback instructions for infrastructure changes.
- Avoid unnecessary dependencies.
- Update documentation when behavior, topology, or security posture changes.
- Prefer another operator/reviewer for changes touching config, scripts, runbooks, or deployment docs.

## Branch and Commit Conventions

- Branch from `main` using a short, descriptive name (`docs/...`, `ops/...`, `config/...`, `fix/...`, `chore/...`).
- Write commit messages that explain **why**, in present tense, concise (1–2 sentences).
- Do not commit generated node databases, keystores, or `~/.avalanche-cli` copies.
- Do not use commit messages that imply token sales, investment, or monetary value for TAMAYA.

### Commit message style

Use clear prefixes:

```text
docs: update validator documentation
infra: add RPC health-check example
security: strengthen secret-handling rules
contracts: add settlement proof registry
onetap: document settlement batching
moveplus: document wallet integration
fix: correct testnet configuration
chore: repository maintenance
```

## No Secrets

Forbidden in PRs and commits:

- `.env` (use `.env.example` placeholders only)
- Private keys, mnemonics, keystores, PEM keys, cloud credentials
- Validator staking/TLS private material
- Wallet-export output
- Screenshots containing phrases, private keys, or credentials

If unsure whether something is secret, **do not commit it**.

## Documentation Updates

Update docs when you change:

| Change type | Also update |
|---|---|
| Architecture or policy | ADRs and/or architecture docs |
| Operator procedure | Relevant runbook under `docs/operations/` |
| Integration posture | `docs/integrations/` and numbered integration docs as needed |
| Security practice | `SECURITY.md` and key-separation docs |
| Repo layout / scripts | `README.md` structure section if needed |

## Deployment-Affecting Changes

Any change that can affect create/deploy/runtime behavior requires, in the PR description:

1. **Runbook impact** — which phases/docs change
2. **Verification plan** — how operators confirm success (read-only checks preferred)
3. **Rollback plan** — how to reverse or halt safely
4. **Security impact** — roles, keys, and blast radius

Mark Avalanche create/deploy steps as **approval required** until explicitly authorized.

## Scripts

- Scripts in `scripts/` used for routine operator checks must remain **read-only and non-destructive** unless a future review explicitly expands scope.
- New scripts should use `set -euo pipefail`, avoid printing secrets, and be checked with `bash -n` via `make validate`.

## Pull Requests

- Summarize intent and risk.
- Link related docs, ADRs, or runbook sections.
- Confirm `make validate` was run when structure or scripts changed.
- Do not request merge if secrets are present in the diff.

## Related

- [SECURITY.md](SECURITY.md)
- [docs/operations/local-alpha-runbook.md](docs/operations/local-alpha-runbook.md)
- [README.md](README.md)
