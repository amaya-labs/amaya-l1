# Fuji configuration

Placeholder for **persistent Fuji testnet** declarative configuration.

| Item | Planned direction |
|---|---|
| Environment | `fuji` (persistent testnet) |
| Validators | 1 persistent self-hosted validator (initial) |
| Access | Permissioned |
| Ops | Persistent monitoring and backups |

## Rules

- Do not copy Local Alpha IDs, keys, or node state into this directory.
- Do not store staking keys, TLS material, keystores, or cloud credentials here.
- Populate network specifications only after deliberate Fuji planning and approval.
- Keep Fuji evidence under `deployments/fuji/`.

## Status

Not configured. Local Alpha must complete its evidence and review gates before Fuji configuration work begins in earnest.

## Related

- [Architecture overview](../../docs/architecture/overview.md)
- [Key separation](../../docs/operations/key-separation.md)
- [Deployment records](../../docs/operations/deployment-records.md)
