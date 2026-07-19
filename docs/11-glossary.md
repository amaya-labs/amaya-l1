# Amaya L1 — Glossary

This glossary explains common terms used throughout the Amaya L1 documentation.

## Amaya L1

A planned permissioned Avalanche Layer 1 network being researched for Move+, OneTap, marketplace settlement, payment reconciliation, and verifiable real-world systems.

## Amaya Local Alpha

The first local Amaya L1 Proof of Concept using one validator, a local RPC endpoint, test wallets, and TAMAYA.

## Amaya Testnet

An Amaya L1 testing environment that uses valueless assets and non-production infrastructure.

## AMAYA

The name reserved for a possible future production ecosystem asset.

No AMAYA production asset is currently represented or guaranteed by this repository.

## Application Relayer

An approved service that submits blockchain transactions on behalf of an application and may sponsor the transaction gas.

Move+ and OneTap should use separate relayer wallets.

## Avalanche

A blockchain ecosystem supporting the creation of independent Avalanche Layer 1 networks.

## Avalanche C-Chain

Avalanche's EVM-compatible primary smart-contract chain.

A possible future production AMAYA ERC-20 asset may be researched for deployment on Avalanche C-Chain, subject to legal, technical, and security review.

## Avalanche L1

A sovereign network connected to the Avalanche ecosystem with its own:

- validator set
- native asset
- transaction history
- network configuration
- application rules
- fee configuration

## Blockchain

A shared transaction and state record maintained by a network of nodes according to agreed rules.

## Block

A confirmed collection of transactions and network-state changes added to the blockchain.

## Chain ID

A numeric identifier used by EVM wallets and applications to distinguish one blockchain network from another.

## Consensus

The process through which validators agree on the valid order and result of transactions.

## Contract Deployer

A wallet or account authorized to deploy smart contracts.

The contract deployer should remain separate from validator management and treasury authority.

## Cryptographic Hash

A fixed-length digital fingerprint generated from data or a document.

Changing the original content produces a different hash.

A hash can verify integrity but cannot reconstruct a missing document.

## Dedicated RPC Node

A non-validating node or service used to handle application, wallet, explorer, and public RPC traffic separately from validator administration.

## Digital Signature

Cryptographic proof that a wallet or authorized signing key approved a message or transaction.

## Document Hash

A cryptographic fingerprint generated from an exact document file.

It can prove whether a retrieved document still matches the registered version.

## EVM

Ethereum Virtual Machine.

An EVM-compatible network can use familiar Ethereum smart-contract languages, wallets, and development tools.

## Explorer

A service that organizes blockchain data and allows users to view:

- blocks
- transactions
- wallet addresses
- smart contracts
- token transfers
- network activity

## Faucet

A service that distributes limited amounts of a valueless testnet asset.

A future Amaya Testnet faucet may distribute TAMAYA.

## Fuji Testnet

Avalanche's public testing environment used for L1 deployment and development without using mainnet assets.

Fuji assets have no intended monetary value.

## Gas

The measurement used to calculate the computational cost of executing a blockchain transaction.

## Gas Price

The amount of native network asset charged per unit of gas.

## Gas Sponsorship

A design where an approved application or relayer pays the blockchain transaction fee instead of requiring the user to hold the native gas asset.

## Genesis Configuration

The starting configuration of a blockchain.

It may define:

- network parameters
- native asset
- initial balances
- fee configuration
- enabled precompiles
- administrative settings

## Government Integration Gateway

A proposed service that validates authorized government-system requests, generates document hashes, removes prohibited fields, and submits approved proof transactions to Amaya L1.

It does not independently approve government contracts or payments.

## Idempotency

A property ensuring that retrying the same request does not create duplicate independent results.

## Indexer

A service that reads blockchain data and organizes it into a database optimized for searching, dashboards, and explorers.

## Layer 1

A blockchain network that operates its own consensus and official state.

Amaya L1 is planned as an Avalanche Layer 1 rather than an Ethereum Layer 2 rollup.

## Mainnet

A production blockchain environment using real assets and serving real applications.

Amaya L1 mainnet has not launched.

## Merkle Root

A cryptographic summary representing a group of records.

It can be used to prove that an individual item belongs to a registered batch without storing every item directly on-chain.

## Multisignature Wallet

A wallet requiring approvals from multiple authorized signers before performing a protected action.

## Native Asset

The protocol-level asset used by a blockchain for transaction gas.

TAMAYA is planned as the native asset of Amaya Testnet.

## Node

A computer or server running blockchain software and maintaining network information.

A node may serve as a validator, RPC/API node, or another infrastructure role.

## Non-Custodial Wallet

A wallet where the user controls the private keys and transactions require the user's authorization.

## Nonce

A value used to order account transactions and prevent transaction replay.

A separate nonce may also be used in signed-message challenges.

## OneTap Device Validator

The OneTap application running on a transport or parking device.

It reads tap cards, validates local rules, processes transactions, and queues records when offline.

It is different from an Amaya L1 blockchain validator.

## OneTap Settlement Batch

A group of reconciled OneTap transactions summarized into a batch for settlement verification.

## On-Chain

Data or actions recorded directly within the blockchain state or transaction history.

## Off-Chain

Data or actions stored or processed outside the blockchain.

Private application and personal information should normally remain off-chain.

## Permissioned Network

A network where participation in critical roles is restricted.

Amaya L1 may restrict:

- validator membership
- smart-contract deployment
- application relayers
- administrative actions

## Private Key

A secret cryptographic key used to sign transactions and prove control of a wallet or validator identity.

Private keys must never be shared or committed to GitHub.

## Proof of Authority

A validator model where approved operators are authorized to participate in network consensus.

Amaya L1 is researching Proof of Authority for its permissioned testnet and early controlled network design.

## Proof of Concept

A working prototype proving that an idea or system can function.

Amaya Local Alpha is the first planned Proof of Concept.

## Proof of Work

A consensus system where miners compete using computational work.

Amaya L1 is not planned as a Proof-of-Work network.

## Public RPC

An RPC endpoint reachable by external wallets and applications.

A public RPC requires HTTPS, rate limiting, monitoring, and restricted administrative APIs.

## Relayer

See **Application Relayer**.

## Remote Procedure Call

See **RPC**.

## Reconciliation

The process of comparing records from different systems to confirm that they agree.

Examples include comparing:

- OneTap device records
- backend settlement records
- payment confirmations
- Amaya settlement proofs

## Recovery Procedure

A documented process for restoring network service after a server, validator, key, RPC, or application failure.

## RPC

Remote Procedure Call.

The interface used by wallets and applications to:

- read blockchain information
- estimate gas
- submit signed transactions
- retrieve transaction receipts
- call smart-contract functions

## RPC Gateway

An HTTPS and security layer placed in front of one or more RPC nodes.

It may provide:

- rate limiting
- TLS termination
- traffic filtering
- load balancing
- request logging
- denial-of-service protection

## Settlement

The process of finalizing and recording an obligation or transfer between parties.

Amaya L1 initially focuses on settlement proofs rather than directly controlling Philippine-peso funds.

## Settlement Batch

A group of completed and reconciled transactions summarized into one registered proof.

## Smart Account

A programmable account controlled through smart-contract rules rather than only through a traditional private-key account.

## Smart Contract

A program deployed on an EVM-compatible blockchain.

Smart contracts execute according to predefined rules.

## Sponsored Transaction

A transaction where an application or relayer pays the gas fee on behalf of the user.

## Synthetic Data

Fictional or generated data used for demonstrations and testing.

Synthetic data does not represent real people, government records, payments, or organizations.

## TAMAYA

The valueless native test asset planned for Amaya Testnet.

TAMAYA is used only for:

- test gas
- wallet testing
- test transfers
- smart-contract testing
- application integration

TAMAYA is not an investment and does not guarantee future AMAYA.

## Testnet

A blockchain environment used for development and testing.

Testnet infrastructure may be reset, upgraded, stopped, or replaced.

## Transaction

A signed request that may transfer a native asset, call a smart contract, or change blockchain state.

## Transaction Hash

A unique cryptographic identifier associated with a blockchain transaction.

## Treasury

A wallet or multisignature system holding network or application assets allocated for approved purposes.

Testnet and production treasuries must remain separate.

## Validator

A secured blockchain node that:

- checks transactions
- participates in consensus
- confirms blocks
- maintains a synchronized copy of the network

## Validator Identity

The cryptographic identity used by a validator node.

Validator identity files must be protected and backed up securely.

## Validator Manager

The governance component responsible for authorizing, adding, removing, or managing validators.

Validator Manager authority should eventually use multisignature governance.

## Validator Weight

The relative influence assigned to a validator within the network's validator set.

## Versioned Document

A document whose revisions are preserved as separate versions rather than silently overwriting the original.

## Wallet

Software used to manage blockchain accounts, view balances, and sign transactions.

## Wallet Ownership Verification

A process where a user signs a one-time message to prove control of a wallet address without transferring funds.

## Web2

Traditional applications and services that use centralized accounts, servers, and databases.

Move+ and OneTap may combine familiar Web2 user experiences with optional blockchain verification underneath.

## Web3

Applications and infrastructure using blockchain wallets, smart contracts, digital assets, or decentralized networks.
