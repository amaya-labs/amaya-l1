# Mainnet configuration

Placeholder for **mainnet** declarative configuration.

| Item | Planned direction |
|---|---|
| Environment | `mainnet` |
| Access | Permissioned Avalanche L1 |
| Credentials in Git | Never |

## Rules

- Mainnet configuration is isolated from Local Alpha and Fuji.
- No production keys, certificates, or cloud credentials belong in this repository.
- Do not reuse development or testnet identities for mainnet validator, treasury, or deployer roles.
- Populate specifications only after formal mainnet readiness review.

## Status

Not configured. Public testnet expansion and operational maturity precede mainnet work.

## Related

- [SECURITY.md](../../SECURITY.md)
- [Key separation](../../docs/operations/key-separation.md)
- [Architecture overview](../../docs/architecture/overview.md)
