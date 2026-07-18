# OneTap integration notes

OneTap covers **transport and parking** flows that may use sponsored gas on Amaya L1.

## Integration posture

| Topic | Guidance |
|---|---|
| Network | Permissioned Amaya L1 (Subnet-EVM) |
| Local Alpha | Connect only after approved local deploy and RPC verification |
| Gas | TAMAYA for testnet gas/testing only (valueless) |
| Sponsored gas | OneTap relayer identity is **separate** from Move+, treasury, validator, and deployer |
| Bridges | Not available in early testnet (ADR-004) |

## Why a separate relayer

Move+ and OneTap sponsored-gas paths must not share operational keys. A compromise of one application relayer must not automatically imply compromise of the other, the treasury, or validator identity.

## Boundaries

- No real government affiliation, records, or funds—any government-themed demos are synthetic research/demo only
- No early bridges for parking/transport settlement shortcuts
- No reuse of Core development wallets as future production relayers

## Environment expectations

| Environment | Expectation |
|---|---|
| Local Alpha | Optional application smoke tests after network evidence exists |
| Fuji (later) | Permissioned access; dedicated monitoring hooks as required |
| Mainnet (later) | Production OneTap relayer only; dual-control where policy requires |

## Operational requirements

1. Record chain identifiers from official deployment evidence only.
2. Store relayer secrets outside Git; never in `.env` committed files or screenshots.
3. Coordinate fee sponsorship changes with infrastructure owners before affecting shared network policy.

## Related

- [Architecture overview](../architecture/overview.md)
- [Key separation](../operations/key-separation.md)
- [Move+ integration](./move-plus.md)
- [Incident response](../operations/incident-response.md)
