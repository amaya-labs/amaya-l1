# Amaya L1 security policy

**TAMAYA is a valueless testnet asset used only for gas and network testing.**

## No secrets in Git

Never commit:

- Wallet private keys or recovery phrases / mnemonics / seeds
- Validator staking keys or node TLS private keys
- Keystores, PEM private keys, certificates with private keys
- API keys, cloud credentials, Terraform state with secrets
- Production passwords, auth tokens, or `.env` files with credentials

Allowed: public identifiers (Blockchain ID, Subnet/L1 ID, EVM Chain ID, Amaya L1 RPC URL without embedded secrets, L1 validator NodeID, component versions, deployment timestamps) and declarative non-secret specs under `config/`.

If a secret is committed accidentally: rotate it immediately, treat it as compromised, and follow [docs/operations/incident-response.md](docs/operations/incident-response.md). History scrubbing still requires assuming exposure.

## Local Alpha network exposure

- Keep Local Alpha bound to **localhost** only.
- Do not recommend or configure exposure via `0.0.0.0`.
- Do not hard-code port **9650** as the Amaya L1 RPC; discover the URL from deployment output.
- Do not record private keys, recovery phrases, public development-key private material, staking keys, or wallet-export output in deployment evidence.

## No production keys on the development MacBook

Local Alpha work uses disposable testing identities. Do not store production validator, treasury, or cloud-admin credentials on the development laptop used for Local Alpha experiments.

## Role separation

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

## Core development wallet

Any Core Wallet account used for Local Alpha is **testing-only**. It is not a production treasury, not a validator identity, and not a long-term relayer.

## Offline backups

- Maintain offline, access-controlled backups for validator and production material when those environments exist.
- Do not use this Git repository as a backup target for keys.
- Do not copy `~/.avalanche-cli` into the repository.

## Incident reporting and key compromise

1. Do not paste secrets into issues, PRs, or chat.
2. Isolate the affected role and rotate credentials.
3. Follow [docs/operations/incident-response.md](docs/operations/incident-response.md).
4. Report repository security concerns through the private operator channel; include only non-secret reproduction details.

## Screenshots and screen sharing

Do not capture or share screenshots that show:

- Recovery phrases or seed words
- Private keys or QR-encoded secrets
- Keystore passwords or cloud console secrets
- Funded production dashboards with live credentials visible

## Approval gates

Ask a human before:

- Avalanche blockchain create / deploy / reset / clean
- Validator set changes
- Destructive filesystem or network operations
- Git push or publishing remotes (when not already approved)

## Related documents

- [README.md](README.md)
- [CONTRIBUTING.md](CONTRIBUTING.md)
- [docs/operations/local-alpha-runbook.md](docs/operations/local-alpha-runbook.md)
