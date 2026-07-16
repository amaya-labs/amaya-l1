
# Contributing to Amaya L1

Amaya L1 is currently in an early research, documentation, and proof-of-concept stage.

Contributions should remain focused, secure, clearly documented, and aligned with the current project scope.

## Current Scope

The initial Amaya L1 scope includes:

- Amaya L1 infrastructure
- Validators and RPC nodes
- Amaya Testnet
- TAMAYA test transactions
- Move+
- Move+ Marketplace
- OneTap transport and parking
- Payment and settlement research
- Government document and payment-proof demonstrations

Project Agilus is not part of the current Amaya L1 scope.

## Before Contributing

Before making a major change:

1. Open an issue describing the proposed change.
2. Explain the problem being solved.
3. Identify affected files or components.
4. Include relevant official Avalanche documentation.
5. Describe security, compatibility, and rollback considerations.

Small documentation corrections may be submitted directly through a pull request.

## Contribution Rules

- Keep pull requests focused on one clear change.
- Do not commit secrets or credentials.
- Do not include production IP addresses or internal infrastructure details.
- Use placeholders in public configuration examples.
- Clearly label experimental and untested procedures.
- Do not claim government approval, partnerships, audits, funding, or production readiness without evidence.
- Do not introduce real-money functionality into testnet code.
- Verify infrastructure commands against current official Avalanche documentation.
- Include recovery or rollback instructions for infrastructure changes.
- Avoid unnecessary dependencies.

## Commit Message Style

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
