# Key and role separation

Amaya L1 requires strict separation of operational identities. A development wallet must **never** become the future production treasury or validator identity.

## Required roles

| Role | Purpose | Must not also be |
|---|---|---|
| **Validator / node identity** | Block production and node authentication | Deployer, treasury, app relayers, monitoring write keys |
| **Network deployer / admin** | Chain configuration and permissioned admin actions | Validator staking identity, treasury, user wallets |
| **Treasury** | Controlled fund custody (when applicable) | Validator, deployer, day-to-day relayers |
| **Move+ sponsored-gas relayer** | Move+ fee sponsorship | OneTap relayer, treasury, validator |
| **OneTap sponsored-gas relayer** | OneTap fee sponsorship | Move+ relayer, treasury, validator |
| **Monitoring** | Metrics, logs, alerts | Privileged deploy or treasury signing |
| **Cloud infrastructure access** | Hosts, networks, backups | Application signing keys or validator cold material |

## Local Alpha rules

1. Use disposable **testing-only** accounts for Core Wallet and transfer tests.
2. Do not generate “temporary” dual-purpose keys “just for Local Alpha” that you plan to promote later.
3. Keep validator material out of this repository and out of application `.env` files.
4. Do not store production credentials on the development MacBook used for Local Alpha experiments.

## Handling material

| Material | Allowed in Git? | Notes |
|---|---|---|
| Blockchain ID, chain ID, RPC URL, NodeID | Yes (public identifiers) | Prefer deployment records |
| Staking keys / TLS keys | **No** | Offline / secured host storage |
| Keystores, mnemonics, seed phrases | **No** | Never |
| Cloud access keys | **No** | Provider secret stores |
| Relayer private keys | **No** | Per-app secret management |

## Promotion ban

| From | To | Allowed? |
|---|---|---|
| Local Alpha test wallet | Production treasury | **No** |
| Local Alpha test wallet | Production validator | **No** |
| Fuji operator key | Mainnet validator (same key) | **No** without formal dual-control redesign |
| Core development wallet | Any production role | **No** |

## Related

- [SECURITY.md](../../SECURITY.md)
- [Incident response](./incident-response.md)
- [Move+ integration](../integrations/move-plus.md)
- [OneTap integration](../integrations/onetap.md)
