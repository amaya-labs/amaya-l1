# Amaya L1

**Infrastructure for a Moving World**

Amaya L1 is a permissioned Avalanche L1 that provides dedicated settlement infrastructure for mobility and transport applications. It is built with Subnet-EVM and is operated as a controlled network—not an open public chain for arbitrary token issuance.

| | |
|---|---|
| **Repository** | [amaya-labs/amaya-l1](https://github.com/amaya-labs/amaya-l1) |
| **Architecture** | Permissioned Avalanche L1 · Subnet-EVM |
| **Consensus (direction)** | Proof of Authority |
| **Current milestone** | Local Alpha |
| **Testnet gas symbol** | TAMAYA |

**TAMAYA is a valueless testnet asset used only for gas and network testing.** It has no monetary value, is not offered for sale, and must not be treated as an investment instrument.

---

## Current development status

| Field | Value |
|---|---|
| Milestone | **Local Alpha** |
| Amaya L1 validators | **1** (sovereign local validator) |
| Supporting Primary Network nodes | CLI-managed (not Amaya L1 validators) |
| Amaya L1 RPC | Discovered from deployment output (localhost; dynamic port) |
| Bridges | Disabled |
| Public faucet | Disabled |
| Production credentials in this repo | Never |

Local Alpha proves that **one sovereign Amaya L1 validator** can run locally, expose an RPC URL discovered from deployment output, connect from Core Wallet, and support TAMAYA balance and transfer testing—before any persistent or public testnet work begins.

Avalanche CLI may also start supporting **Primary Network** nodes (commonly on ports such as 9650/9652). Those nodes are part of the local harness and are **not** additional Amaya L1 validators. The Amaya L1 RPC often uses a **dynamically assigned localhost port**—never hard-code **9650** as the Amaya L1 RPC.

### Local Alpha objective

1. One sovereign Amaya L1 validator
2. Amaya L1 RPC discovered from deployment output, reachable on localhost, and documented
3. Core Wallet network detection
4. TAMAYA balance and transfer testing
5. Evidence recorded under controlled operational practice

Creation and deployment of the Local Alpha chain require explicit approval. This repository prepares infrastructure, documentation, and safe preflight tooling only.

---

## Architecture sequence

```text
1. Local Alpha
   └── 1 Amaya L1 validator · CLI-managed Primary Network support nodes
       · Amaya L1 RPC discovered at deploy (localhost) · Core · TAMAYA tests

2. Persistent Fuji testnet
   └── 1 persistent self-hosted Amaya L1 validator · permissioned access · monitoring · backups

3. Public testnet expansion
   └── 3 Amaya L1 validators · dedicated RPC · explorer/indexer · alerts · controlled faucet
```

Environments stay isolated. Local Alpha configuration must not be copied blindly into Fuji or mainnet paths. Port assignments and local topology are Avalanche CLI implementation details and may change between CLI versions.

---

## Core infrastructure components

| Component | Role |
|---|---|
| AvalancheGo + Subnet-EVM | Amaya L1 validator and execution environment |
| Permissioned validator set | Controlled participation (PoA direction); Local Alpha count = 1 |
| Supporting Primary Network nodes | CLI-managed local harness only; not Amaya L1 validators |
| Amaya L1 RPC | Discovered at deployment; localhost-only in Local Alpha; dynamic port |
| Network specification | Declarative, non-secret config under `config/` |
| Deployment records | Evidence and IDs under `deployments/` and ops docs—never secrets |
| Monitoring / backups | Introduced for persistent Fuji and beyond |

---

## Primary application integrations

| Application | Integration posture |
|---|---|
| **Move+** | Primary mobility application on Amaya L1 |
| **Move+ Marketplace** | Marketplace flows on the permissioned network |
| **OneTap** | Transport and parking sponsored-gas flows |
| **Approved institutional integrations** | Explicitly approved partners only |

Each sponsored-gas path uses a **separate** relayer identity. See [docs/operations/key-separation.md](docs/operations/key-separation.md) and [docs/integrations/](docs/integrations/).

---

## Explicit non-goals

This project does **not**:

- Operate a public token-launch platform
- Allow unrestricted third-party fungible tokens
- Enable bridges during early testnet (local interop tooling defaults do not authorize Amaya L1 bridges)
- Provide exchange, lending, remittance, or public financial-service functionality
- Include Project Agilus
- Claim real government affiliation, records, or funds (any government-themed work is synthetic research/demo only)
- Expose Local Alpha RPC beyond localhost (do not bind via `0.0.0.0`)

---

## Repository structure

```text
amaya-l1/
├── .cursor/rules/          # Repository Cursor agent rules
├── config/                 # Declarative network specs (non-secret)
│   ├── local-alpha/
│   ├── fuji/
│   └── mainnet/
├── deployments/            # Deployment evidence placeholders (no secrets)
├── docs/
│   ├── architecture/       # System overview
│   ├── decisions/          # Architecture Decision Records
│   ├── integrations/       # App integration notes
│   └── operations/         # Runbooks, key separation, incidents
├── scripts/                # Read-only validation and preflight
├── CONTRIBUTING.md
├── Makefile
├── README.md
├── SECURITY.md
└── .env.example            # Non-secret placeholders only
```

---

## Security principles

1. **No secrets in Git** — keys, phrases, keystores, certificates, and cloud credentials stay out of this repository.
2. **Role separation** — validator/node identity, network deployer/admin, treasury, Move+ relayer, OneTap relayer, monitoring, and cloud access remain distinct.
3. **Dev wallets stay disposable** — a development wallet must never become production treasury or validator identity.
4. **Environment isolation** — Local Alpha, Fuji, and mainnet configs and evidence stay separate.
5. **Approval gates** — Avalanche create/deploy/reset, destructive ops, and Git push require explicit human approval.

Details: [SECURITY.md](SECURITY.md) · [docs/operations/key-separation.md](docs/operations/key-separation.md)

---

## Safe local preflight

These commands are **read-only**. They install nothing, start no services, and do not create or deploy a blockchain.

```bash
# From the repository root
make preflight    # or: bash scripts/preflight.sh
make validate     # or: bash scripts/validate-repository.sh
make status       # Git status + Avalanche CLI version (non-secret)
```

See [docs/operations/local-alpha-runbook.md](docs/operations/local-alpha-runbook.md) for staged Local Alpha phases. Creation and deployment commands are marked **approval required** and are not executed from this setup task.

---

## Milestone checklist

### Local Alpha

- [ ] Repository structure and security docs in place
- [ ] Preflight and repository validation pass (or documented warnings)
- [ ] Avalanche CLI verified on the operator machine (**approval required** for install if missing)
- [ ] Local Alpha network configured deliberately (**approval required**)
- [ ] Local Alpha deployed (**approval required**)
- [ ] Amaya L1 RPC URL discovered from deployment output (not assumed as port 9650)
- [ ] RPC verified against the Amaya L1 validator endpoint
- [ ] Core Wallet detects the network
- [ ] TAMAYA balance and transfer test completed and recorded
- [ ] Shutdown and evidence recorded per runbook

### Persistent Fuji (later)

- [ ] Single persistent self-hosted validator
- [ ] Permissioned access controls documented
- [ ] Monitoring and backup procedures active

### Public testnet expansion (later)

- [ ] Three validators
- [ ] Dedicated RPC infrastructure
- [ ] Explorer / indexer
- [ ] Monitoring and alerts
- [ ] Controlled faucet (not unrestricted)

---

## Documentation map

| Document | Purpose |
|---|---|
| [docs/architecture/overview.md](docs/architecture/overview.md) | Architecture overview |
| [docs/decisions/](docs/decisions/) | ADRs (permissioned L1, PoA, TAMAYA, no early bridges) |
| [docs/operations/local-alpha-runbook.md](docs/operations/local-alpha-runbook.md) | Local Alpha staged runbook |
| [docs/operations/deployment-records.md](docs/operations/deployment-records.md) | What to record after deployments |
| [CONTRIBUTING.md](CONTRIBUTING.md) | Contribution and review standards |
| [SECURITY.md](SECURITY.md) | Security policy |

---

## License and contact

Contribution and security reporting guidance live in [CONTRIBUTING.md](CONTRIBUTING.md) and [SECURITY.md](SECURITY.md). Do not open issues that include recovery phrases, private keys, or credentials.
