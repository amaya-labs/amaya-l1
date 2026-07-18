# Move+ integration notes

Move+ is a **primary application** on Amaya L1. Move+ Marketplace is in scope as a related marketplace surface on the same permissioned network.

## Integration posture

| Topic | Guidance |
|---|---|
| Network | Permissioned Amaya L1 (Subnet-EVM) |
| Local Alpha | Use local validator RPC only after approved deploy |
| Gas | TAMAYA for testnet gas/testing only (valueless) |
| Sponsored gas | Move+ relayer identity is **separate** from OneTap, treasury, validator, and deployer |
| Bridges | Not available in early testnet (ADR-004) |

## Boundaries

Move+ integration on Amaya L1 must not introduce:

- Public token-launch functionality
- Unrestricted third-party fungible token platforms
- Exchange, lending, remittance, or public financial-service features via this network path
- Shared use of validator or treasury keys for application sponsorship

## Environment expectations

| Environment | Expectation |
|---|---|
| Local Alpha | Smoke tests: RPC, wallet detection, TAMAYA transfers |
| Fuji (later) | Persistent permissioned access; monitoring; separate keys |
| Mainnet (later) | Production identities only; never promote Local Alpha wallets |

## Operational requirements

1. Document RPC URL, chain ID, and blockchain ID from deployment records—do not invent values.
2. Keep Move+ sponsored-gas relayer keys offline from this repository and from validator hosts where feasible.
3. Any deployment-affecting contract or fee-policy change needs a verification plan and rollback plan (see CONTRIBUTING.md).

## Related

- [Architecture overview](../architecture/overview.md)
- [Key separation](../operations/key-separation.md)
- [OneTap integration](./onetap.md)
- [ADR-003 TAMAYA](../decisions/ADR-003-tamaya-testnet-asset.md)
