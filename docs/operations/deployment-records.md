# Deployment records

How to record Amaya L1 deployments **without** placing secrets in Git.

## What to record

After an **approved** create/deploy, capture the following **non-secret** fields:

| Field | Notes | Secret? |
|---|---|---|
| Avalanche CLI version | From `avalanche --version` / deploy context | No |
| AvalancheGo version | From deploy/runtime evidence if available | No |
| Subnet-EVM version | From deploy/runtime evidence if available | No |
| Deployment timestamp | UTC | No |
| Environment | `local-alpha` / `fuji` / `mainnet` | No |
| Chain ID (EVM) | From deploy output / config | No |
| Token symbol | `TAMAYA` for Local Alpha / early testnet | No |
| Subnet / L1 ID | From deploy output | No |
| Blockchain ID | From deploy output | No |
| L1 validator Node ID | Amaya L1 validator only (not Primary Network support nodes) | No |
| Amaya L1 RPC URL | **Discovered from successful deployment output**; localhost-only for Local Alpha | No |
| RPC health verification result | Pass/fail + brief non-secret notes | No |
| Core network detection result | Pass/fail | No |
| TAMAYA balance verification | Pass/fail (testing accounts only) | No |
| TAMAYA transfer transaction hash | Public tx hash | No |
| Shutdown status | Stopped / cleaned (if approved) / still running | No |

For Local Alpha, also note (non-secret): CLI-managed supporting Primary Network nodes may be present; they are **not** Amaya L1 validators. Do not treat ports such as **9650** as the Amaya L1 RPC unless deployment output explicitly says so (it usually will not).

## What never to record in this repository

This GitHub repository is **public**. Do not place real operational deployment evidence here.

Never record:

- Private keys (including public development-key private material)
- Recovery phrases / mnemonics / seeds
- Wallet-export output
- Validator staking key material
- TLS private keys and certificates with private keys
- Keystores
- Cloud credentials and API keys
- Production passwords or auth tokens
- Private validator IP inventories
- SSH usernames, hosts, or access instructions
- Cloud account, project, tenant, subscription, or instance identifiers
- Monitoring tokens, webhook URLs, alert destinations, or dashboard credentials
- Backup locations or private storage paths
- Firewall, VPN, bastion, or private-network details
- Internal-only or authenticated RPC credentials
- Screenshots containing any of the above
- Copies of `~/.avalanche-cli` contents

**Real operational deployment records** (IPs, SSH, cloud IDs, monitoring, backups, firewall posture) must be stored in a **separate private operations repository**, not in `amaya-labs/amaya-l1`.

Public-safe Local Alpha evidence in this repository is limited to non-secret identifiers and pass/fail verification notes from the template below.

## Directory convention

```text
deployments/
├── local-alpha/    # Non-secret Local Alpha evidence
├── fuji/           # Non-secret Fuji evidence
└── mainnet/        # Non-secret mainnet evidence
```

Use clear filenames such as `2026-07-18-local-alpha-evidence.md` when you add records. Prefer public identifiers and checklists over dumping CLI home directories.

**Do not** copy contents of `~/.avalanche-cli` into this repository.

## Evidence template (Local Alpha)

Copy into `deployments/local-alpha/` after an approved deploy. Fill only non-secret values.

```markdown
# Local Alpha deployment evidence

- Avalanche CLI version:
- AvalancheGo version:
- Subnet-EVM version:
- Deployment timestamp (UTC):
- Environment: local-alpha
- EVM Chain ID:
- Token symbol: TAMAYA
- Subnet / L1 ID:
- Blockchain ID:
- L1 validator Node ID:
- Amaya L1 RPC URL:   # from deployment output — do not invent / hard-code 9650
- RPC health verification result:
- Core network detection result:
- TAMAYA balance verification:
- TAMAYA transfer transaction hash:
- Shutdown status:

## Notes (non-secret)

- Supporting Primary Network nodes observed (yes/no; ports if known):
- Amaya L1 validator count confirmed: 1
```

## Evidence checklist (Local Alpha)

- [ ] Approval noted for create/deploy
- [ ] Avalanche CLI version recorded
- [ ] AvalancheGo version recorded (if available)
- [ ] Subnet-EVM version recorded (if available)
- [ ] Deployment timestamp recorded
- [ ] Environment recorded (`local-alpha`)
- [ ] EVM Chain ID recorded
- [ ] Token symbol recorded (`TAMAYA`)
- [ ] Subnet / L1 ID recorded
- [ ] Blockchain ID recorded
- [ ] L1 validator Node ID recorded
- [ ] Amaya L1 RPC URL recorded from deployment output
- [ ] RPC health verification result recorded
- [ ] Core network detection result recorded
- [ ] TAMAYA balance verification recorded
- [ ] TAMAYA transfer transaction hash recorded
- [ ] Shutdown status recorded
- [ ] No private keys, phrases, staking keys, or wallet-export output included
- [ ] `make validate` clean of secret-like filenames

## Related

- [Local Alpha runbook](./local-alpha-runbook.md)
- [config/local-alpha/README.md](../../config/local-alpha/README.md)
- [SECURITY.md](../../SECURITY.md)
