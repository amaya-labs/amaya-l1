
# Security Policy

## Reporting a Vulnerability

Do not open a public GitHub issue for security vulnerabilities.

Report vulnerabilities privately through the official Amaya Labs GitHub organization or the published Amaya L1 security contact once available.

Please include:

- A clear description of the issue
- Affected component or file
- Steps to reproduce
- Possible security impact
- Suggested mitigation, when available

Do not exploit the issue, access data that does not belong to you, or publicly disclose the vulnerability before it has been reviewed.

## Secret Handling

Never commit or upload:

- Seed phrases
- Wallet private keys
- Validator identity or signing keys
- `staker.key`
- `staker.crt`
- `signer.key`
- Wallet keystores
- Real `.env` files
- SSH private keys
- Cloud-provider credentials
- Server passwords
- Treasury credentials
- Multisig recovery material
- Production RPC credentials
- API keys or access tokens

Use placeholder values inside public examples.

## Testnet Security Rules

- Testnet keys must never be reused on mainnet.
- No real funds should be placed on experimental infrastructure.
- TAMAYA has no monetary value.
- Public RPC endpoints must not expose administrative APIs.
- Validator administration interfaces must remain private.
- Validators, RPC nodes, relayers, deployers, and treasury wallets must use separate credentials.
- Destructive commands require manual review before execution.
- Important infrastructure changes must be recorded in `CHANGELOG.md`.
- Validator stop, restart, backup, and recovery procedures must be tested and documented.

## Production Security Principles

Before any Amaya L1 mainnet launch:

- Use isolated validators across separate machines or environments.
- Use multisig control for validator management and treasury operations.
- Use hardware wallets for critical governance signers.
- Operate dedicated RPC nodes separately from validators.
- Enable monitoring, alerts, backups, and incident-response procedures.
- Complete independent smart-contract and infrastructure security reviews.
- Avoid launching a public bridge until it has been separately audited and secured.

## Supported Versions

Amaya L1 is currently in research and proof-of-concept development.

No production version is supported at this stage.
