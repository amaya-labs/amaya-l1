# Security Policy

**TAMAYA is a valueless testnet asset used only for gas and network testing.**

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

Reports should confirm that no real user funds or private data were accessed. Never include recovery phrases, private keys, or credentials in tickets.

## Secret Handling

Never commit or upload:

- Seed phrases / recovery phrases / mnemonics
- Wallet private keys (including public development-key private material)
- Validator identity or signing keys
- `staker.key` / `staker.crt` / `signer.key`
- Wallet keystores or wallet-export output
- Real `.env` files
- SSH private keys
- Cloud-provider credentials
- Server passwords
- Treasury credentials
- Multisig recovery material
- Production RPC credentials
- API keys or access tokens
- TLS private keys and certificates with private keys
- Terraform state containing secrets

Use placeholder values inside public examples (see `.env.example`).

Allowed in Git: public identifiers (Blockchain ID, Subnet/L1 ID, EVM Chain ID, Amaya L1 RPC URL without embedded secrets, L1 validator NodeID, component versions, deployment timestamps) and declarative non-secret specs under `config/`.

If a secret is committed accidentally: rotate it immediately, treat it as compromised, and follow [docs/operations/incident-response.md](docs/operations/incident-response.md). History scrubbing still requires assuming exposure.

## Role Separation

Keep these roles separate at all times:

1. Validator / node identity
2. Network deployer / admin
3. Treasury
4. Move+ sponsored-gas relayer
5. OneTap sponsored-gas relayer
6. Monitoring
7. Cloud infrastructure access

A development wallet must never become the future production treasury or validator identity.

See [docs/operations/key-separation.md](docs/operations/key-separation.md).

## Local Alpha Network Exposure

- Keep Local Alpha bound to **localhost** only.
- Do not recommend or configure exposure via `0.0.0.0`.
- Do not hard-code port **9650** as the Amaya L1 RPC; discover the URL from deployment output.
- Do not record private keys, recovery phrases, staking keys, or wallet-export output in deployment evidence.
- Do not store production credentials on the development MacBook used for Local Alpha experiments.
- Do not copy `~/.avalanche-cli` into this repository.

Any Core Wallet account used for Local Alpha is **testing-only**.

## Testnet Security Rules

- Testnet keys must never be reused on mainnet.
- No real funds should be placed on experimental infrastructure.
- TAMAYA has no monetary value.
- Public RPC endpoints must not expose administrative APIs.
- Validator administration interfaces must remain private.
- Validators, RPC nodes, relayers, deployers, and treasury wallets must use separate credentials.
- Destructive commands require manual review before execution.
- Important infrastructure changes should be recorded in operator evidence / changelog practice when available.
- Validator stop, restart, backup, and recovery procedures must be tested and documented.
- Early-testnet bridges remain disabled (local interop tooling defaults do not authorize Amaya L1 bridges).

## Screenshots and Screen Sharing

Do not capture or share screenshots that show:

- Recovery phrases or seed words
- Private keys or QR-encoded secrets
- Keystore passwords or cloud console secrets
- Funded production dashboards with live credentials visible

## Approval Gates

Ask a human before:

- Avalanche blockchain create / deploy / reset / clean
- Validator set changes
- Destructive filesystem or network operations
- Git push or publishing remotes (when not already approved)

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

## Related Documents

- [README.md](README.md)
- [CONTRIBUTING.md](CONTRIBUTING.md)
- [docs/operations/local-alpha-runbook.md](docs/operations/local-alpha-runbook.md)
- [docs/operations/incident-response.md](docs/operations/incident-response.md)
- [docs/07-security-model.md](docs/07-security-model.md)
