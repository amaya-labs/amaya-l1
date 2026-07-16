# Amaya L1

**Infrastructure for a Moving World.**

Amaya L1 is a Philippine-focused research and development initiative exploring a permissioned Avalanche Layer 1 network for practical consumer, mobility, marketplace, payment-settlement, and verification use cases.

> **Current status:** Planning and documentation.  
> No public mainnet, token sale, government partnership, remittance partnership, or production payment service is implied.

## Why Amaya L1

Amaya L1 is being studied as shared infrastructure for approved applications that may benefit from:

- configurable low-cost transaction fees
- permissioned validators and contract deployment
- gas-sponsored user experiences
- verifiable settlement and reconciliation
- tamper-evident records and audit trails
- dedicated capacity for Amaya applications

## Initial ecosystem scope

### Core infrastructure

- **Amaya L1** — planned Avalanche-based permissioned network
- **Amaya Testnet** — educational and public testing environment
- **TAMAYA** — valueless native test asset used only for testing
- **Validator and RPC infrastructure**
- **Amaya Explorer and network status**
- **Amaya Wallet Testnet** — planned non-custodial test wallet

### Primary applications

- **Move+** — gamified fitness, activity rewards, and optional digital gear
- **Move+ Marketplace** — real-item and digital-utility marketplace
- **OneTap** — transport and parking payment and reconciliation prototype

### Future research areas

- payment and settlement infrastructure for approved partners
- government supplier and contractor payment proofs
- document authenticity and version verification
- institutional audit and reconciliation systems

## Development principles

1. **Products first, network second.**
2. **Testnet before mainnet.**
3. **No real funds on experimental infrastructure.**
4. **Private data remains off-chain.**
5. **Validators, RPC, treasury, and application keys remain separated.**
6. **No unverified partnership or adoption claims.**
7. **Security and recoverability are treated as core features.**

## Planned technical path

```mermaid
flowchart LR
    A[Documentation] --> B[Local 1-validator PoC]
    B --> C[Wallet connection]
    C --> D[TAMAYA transfer]
    D --> E[OneTap settlement demo]
    E --> F[Move+ integration]
    F --> G[3-validator Fuji testnet]
    G --> H[Dedicated RPC and explorer]
    H --> I[Security and recovery testing]
    I --> J[Public testnet]
    J --> K[Mainnet readiness review]
