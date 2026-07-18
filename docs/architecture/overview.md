# Architecture overview — Amaya L1

**Infrastructure for a Moving World**

Amaya L1 is a **permissioned Avalanche L1** using **Subnet-EVM**. It provides controlled settlement infrastructure for mobility and transport applications (Move+, Move+ Marketplace, OneTap, and approved institutional integrations).

## Design posture

| Principle | Application |
|---|---|
| Permissioned participation | Validator set and network access are controlled |
| Dedicated execution | Subnet-EVM for EVM-compatible application logic |
| PoA direction | Proof of Authority for early and mid-stage operation |
| Valueless test gas | TAMAYA for Local Alpha / early testnet gas only |
| No early bridges | Cross-chain bridges disabled until policy revisit |
| Role separation | Validator, deployer, treasury, relayers, monitoring, cloud stay distinct |

## Milestone architecture

### 1. Local Alpha (current)

Local Alpha operates **one sovereign Amaya L1 validator**. Avalanche CLI may also start supporting **Primary Network** nodes for the local harness; those nodes are **not** Amaya L1 validators and do not increase the Amaya L1 validator count.

```text
┌──────────────────────────────────────────────────────────┐
│  Operator machine (localhost only)                       │
│                                                          │
│  ┌────────────────────────┐  ┌─────────────────────────┐ │
│  │ Supporting Primary     │  │ Amaya L1 validator (1)  │ │
│  │ Network nodes          │  │ Subnet-EVM              │ │
│  │ (CLI-managed)          │  │ RPC: dynamic localhost  │ │
│  │ e.g. ports 9650/9652   │  │ port (from deploy out)  │ │
│  │ — not Amaya L1 vals —  │  │                         │ │
│  └────────────────────────┘  └───────────▲─────────────┘ │
│                                          │               │
│                          Core Wallet / app smoke tests   │
│                          use discovered Amaya L1 RPC URL │
└──────────────────────────────────────────────────────────┘
```

Important topology rules:

- **Never** treat port **9650** as the guaranteed Amaya L1 RPC.
- Discover the Amaya L1 RPC URL from successful deployment output.
- Port layout may change between Avalanche CLI versions.
- Bind Local Alpha to **localhost** only; do not expose via `0.0.0.0`.
- Interop tooling in a default local test config does **not** authorize bridges.

Objectives: one Amaya L1 validator, discovered local RPC, Core network detection, TAMAYA balance/transfer tests, evidence recording.

### 2. Persistent Fuji testnet

- One persistent self-hosted Amaya L1 validator
- Permissioned access
- Persistent monitoring and backups
- Separate identities from Local Alpha and from future production

### 3. Public testnet expansion

- Three Amaya L1 validators
- Dedicated RPC infrastructure (not only validator-node RPC)
- Explorer / indexer
- Monitoring and alerts
- Controlled faucet (not unrestricted public minting)

## Application integration surface

| Consumer | Network use |
|---|---|
| Move+ | Primary mobility application settlement |
| Move+ Marketplace | Marketplace-related on-chain flows |
| OneTap | Transport and parking; separate sponsored-gas relayer |
| Institutional | Explicit approval required |

Sponsored-gas relayers for Move+ and OneTap are **different** operational identities. See [key-separation.md](../operations/key-separation.md).

## Explicit exclusions

- Public token-launch platforms
- Unrestricted third-party fungible tokens
- Early-testnet bridges (including any local interop tooling defaults)
- Exchange, lending, remittance, or public financial-service products
- Project Agilus
- Real government affiliation, records, or funds

## Configuration and evidence layout

| Path | Contents |
|---|---|
| `config/<env>/` | Declarative non-secret network policy |
| `deployments/<env>/` | Non-secret deployment evidence placeholders |
| `docs/decisions/` | ADRs binding architectural choices |
| `docs/operations/` | Runbooks and security operations |

## Related ADRs

- [ADR-001 — Permissioned Avalanche L1](../decisions/ADR-001-permissioned-avalanche-l1.md)
- [ADR-002 — Proof of Authority](../decisions/ADR-002-proof-of-authority.md)
- [ADR-003 — TAMAYA testnet asset](../decisions/ADR-003-tamaya-testnet-asset.md)
- [ADR-004 — No early bridges](../decisions/ADR-004-no-early-bridges.md)
