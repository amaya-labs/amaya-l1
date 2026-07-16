
# Amaya L1 — Architecture

## Overview

Amaya L1 is planned as an EVM-compatible, permissioned Avalanche Layer 1 network.

The initial architecture will begin with one local validator for education and proof-of-concept testing. It may later progress to three validators on Fuji Testnet and a larger validator set only when production readiness is established.

## Architecture Principles

The architecture follows these principles:

- validators are separated from public application traffic
- RPC nodes provide application and wallet access
- application backends retain private business data
- only necessary settlement records and proofs are written on-chain
- administration, deployment, treasury, and relayer keys are separated
- critical systems are designed for monitoring and recovery
- no single public dashboard can control the network

## Local Proof-of-Concept Architecture

```mermaid
flowchart TD
    USER[Developer Wallet] --> RPC[Validator Built-in RPC]
    MOVE[Move+ Test Client] --> RPC
    TAP[OneTap Test Backend] --> RPC

    RPC --> V1[Amaya Validator 1]
    V1 --> CHAIN[Amaya Local Testnet]

    CHAIN --> TX[TAMAYA Transfers]
    CHAIN --> CONTRACTS[Test Smart Contracts]
    CHAIN --> LOGS[Local Logs and Monitoring]
