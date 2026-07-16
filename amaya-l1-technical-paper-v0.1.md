# Amaya L1 Technical Paper

## Infrastructure for a Moving World

**Version:** Draft v0.1  
**Status:** Research and Proof-of-Concept Design  
**Project:** Amaya L1  
**Primary applications:** Move+, Move+ Marketplace, and OneTap  
**Planned network model:** Permissioned Avalanche L1  
**Testnet native asset:** TAMAYA — no monetary value

> This paper describes a proposed technical architecture. Amaya L1 is still in research, documentation, and proof-of-concept development. No public mainnet, token sale, government approval, financial-service licence, remittance partnership, lending partnership, or production deployment is represented by this document.

---

## Abstract

Amaya L1 is a Philippine-focused research initiative exploring a permissioned Avalanche Layer 1 network for consumer applications, mobility infrastructure, marketplace settlement, and verifiable real-world records.

The project begins with two existing application directions:

- **Move+**, a gamified fitness ecosystem with activity tracking, digital gear, rewards, and marketplace functionality.
- **OneTap**, a transport and parking payment prototype designed for tap-card transactions, offline operation, operator reconciliation, and settlement.

Amaya L1 is not intended to replace the application backends, regulated peso-payment systems, or private institutional databases used by these products and future partners. Its intended role is to provide a shared settlement and verification layer for approved applications.

The first technical milestone is a local Proof of Concept using one validator, a local RPC endpoint, an EVM-compatible wallet, and the native TAMAYA test asset. Later phases may add a three-validator Fuji testnet, dedicated RPC infrastructure, explorer support, monitoring, Move+ integration, and OneTap settlement batching.

---

## 1. Vision

Amaya L1 aims to become practical infrastructure connecting:

- movement and fitness
- digital ownership
- marketplace settlement
- transport and parking
- payment reconciliation
- document integrity
- approved institutional applications

The project follows a product-first principle:

> Build useful applications, prove their infrastructure requirements, and introduce a dedicated network only where it creates measurable value.

Amaya L1 is not planned as:

- a meme-token network
- an unrestricted token-launch platform
- a general-purpose permissionless chain at launch
- a replacement for licensed banks or payment operators
- a public database for personal or confidential information
- a system that forces ordinary users to manage blockchain gas manually

---

## 2. Initial Ecosystem Scope

### 2.1 Core Infrastructure

The proposed core infrastructure includes:

- Amaya L1
- Amaya Local Alpha
- Amaya L1 Testnet
- validator nodes
- dedicated RPC nodes
- explorer and indexer services
- monitoring and network-status services
- application relayers
- an optional future Amaya Wallet Testnet

### 2.2 Primary Applications

#### Move+

Move+ is a gamified fitness application covering walking, running, cycling, digital gear, challenges, rewards, and other movement-based features.

Possible Amaya integrations include:

- wallet ownership verification
- sponsored test transactions
- digital-gear ownership
- marketplace settlement proofs
- reward-batch commitments
- challenge or achievement proofs

Raw GPS routes, health information, personal profiles, messages, and detailed anti-cheat data remain off-chain.

#### Move+ Marketplace

Move+ Marketplace supports real-item and digital-utility commerce.

Possible Amaya integrations include:

- merchant settlement proofs
- order-payment verification
- reward distribution
- buyer and seller transaction commitments
- approved marketplace smart contracts

Delivery addresses, customer identities, payment credentials, and private order records remain in protected application databases.

#### OneTap

OneTap is a transport and parking payment prototype designed around:

- tap-card processing
- offline-safe operation
- operator shift management
- transaction reconciliation
- merchant top-ups
- transport and parking settlement

OneTap is planned as the first infrastructure-focused Amaya Proof of Concept.

### 2.3 Potential External Integrations

Amaya L1 may later support duly registered and approved external organizations, including:

- payment providers
- remittance companies
- lending or financing companies
- transport operators
- parking operators
- cooperatives
- enterprises
- government-authorized systems

These are possible integrations, not Amaya-owned applications.

Amaya would provide infrastructure, verification, and settlement proofs. Each external organization remains responsible for its own licences, customer funds, KYC or AML obligations, lending decisions, consumer protection, and regulated operations.

---

## 3. Why an Avalanche L1

Avalanche L1s allow a project to operate a network with its own validator set, native asset, transaction history, and network configuration while remaining connected to the broader Avalanche architecture.

Amaya is researching this model because it may provide:

- controlled validator membership
- controlled smart-contract deployment
- configurable gas economics
- dedicated application capacity
- EVM compatibility
- gas-sponsored user experiences
- application-specific security policies
- future interchain connectivity
- predictable infrastructure for approved applications

Amaya L1 will not automatically inherit the full validator security of Avalanche C-Chain. Amaya validators remain responsible for Amaya L1 consensus and availability.

This creates both sovereignty and responsibility.

---

## 4. Network Model

### 4.1 Permissioned Proof of Authority

The planned early model is a permissioned Proof-of-Authority network.

Approved validator operators may participate in consensus. Validator additions and removals are controlled through the network's validator-management authority.

Initial benefits include:

- controlled infrastructure
- known validator operators
- staged security testing
- predictable network governance
- restricted production deployment
- easier institutional onboarding

This model does not require Amaya L1 to become a public permissionless chain.

Public read access may be offered through an explorer and RPC service while validator participation and contract deployment remain controlled.

### 4.2 Proof of Concept Versus Consensus

These terms are different:

- **Proof of Concept** describes a working prototype proving that the proposed system can function.
- **Proof of Authority** describes the planned validator-management model.
- **Proof of Work** is mining-based consensus and is not planned for Amaya L1.

Amaya Local Alpha is a Proof of Concept using a Proof-of-Authority design.

---

## 5. Technical Architecture

### 5.1 Local Alpha

```mermaid
flowchart TD
    WALLET["Developer Wallet"] --> RPC["Local Validator RPC"]
    MOVE["Move+ Test Client"] --> RPC
    TAP["OneTap Test Backend"] --> RPC
    RPC --> V1["Amaya Validator 1"]
    V1 --> CHAIN["Amaya Local Alpha"]
    CHAIN --> TAMAYA["TAMAYA Transfers"]
    CHAIN --> CONTRACTS["Test Smart Contracts"]
    CHAIN --> LOGS["Logs and Monitoring"]
