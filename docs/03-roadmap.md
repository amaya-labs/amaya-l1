## Roadmap Principle

The roadmap is milestone-based rather than date-based.

Amaya L1 will move to the next stage only after the previous stage is documented, reproducible, and reviewed.

No roadmap phase guarantees a public mainnet or production token launch.

## Phase 0 — Foundation and Documentation

### Objectives

- establish the Amaya Labs GitHub organization
- create the public Amaya L1 repository
- publish the initial vision and architecture
- document security and legal boundaries
- register the Amaya L1 domain
- prepare the documentation website
- review current official Avalanche documentation

### Completion Criteria

- public repository is organized
- project status is clearly disclosed
- no secrets are present in the repository
- initial architecture and roadmap are published
- testnet and production assets are clearly separated

## Phase 1 — Amaya Local Alpha

### Objectives

- create one local Amaya L1 configuration
- operate one local validator
- use the validator's local RPC
- connect an EVM-compatible wallet
- display a TAMAYA balance
- send and confirm a TAMAYA transfer
- stop and restart the validator
- verify that the network state recovers

### Completion Criteria

- validator starts without undocumented manual changes
- RPC health can be confirmed
- wallet connects using documented network settings
- TAMAYA transfer is visible and verifiable
- shutdown and restart procedure is documented
- a clean machine can reproduce the process

## Phase 2 — OneTap Proof of Concept

### Objectives

- connect the OneTap backend to Amaya Local Alpha
- generate a synthetic transport settlement batch
- submit the settlement proof on-chain
- verify the batch through a dashboard or script
- test an altered or mismatched settlement record
- preserve OneTap's offline operation

### Completion Criteria

- local taps work without blockchain connectivity
- completed transactions can be grouped into a batch
- the batch proof is recorded on Amaya
- an altered batch is detected
- no passenger personal data is written on-chain

## Phase 3 — Move+ Proof of Concept

### Objectives

- connect a Move+ development build to Amaya
- read wallet and TAMAYA information
- verify wallet ownership
- submit one sponsored test transaction
- record one marketplace or reward-settlement proof
- document the integration without changing existing production chains

### Completion Criteria

- Move+ can communicate with the Amaya RPC
- existing Ronin, Base, and Celo flows remain unchanged
- no raw activity or health data is stored on-chain
- test transactions are reproducible
- relayer and user-wallet permissions are separated

## Phase 4 — Fuji Testnet Alpha

### Objectives

- deploy Amaya L1 to Fuji Testnet
- operate one persistent validator
- configure a public HTTPS RPC endpoint
- connect an external wallet
- enable explorer access
- add monitoring and alerts
- document validator fee-balance management

### Completion Criteria

- validator remains stable during the agreed test period
- RPC is reachable from an external device
- transactions are visible through an explorer
- monitoring detects outages and recovery
- no production keys or assets are used

## Phase 5 — Three-Validator Public Testnet

### Objectives

- operate three isolated validators
- use separate machines or hosting environments
- introduce a dedicated RPC node
- publish network information
- release public testnet documentation
- publish a network-status page
- practise validator replacement and recovery
- measure transaction performance and storage growth

### Completion Criteria

- all validators can synchronize
- one validator can be replaced using documented procedures
- RPC traffic does not directly expose validator administration
- monitoring and incident records are operational
- Move+ and OneTap demonstrations function on the public testnet
- testnet assets remain valueless

## Phase 6 — Expanded Proofs and Pilot Demonstrations

### Possible Demonstrations

- OneTap transport settlement
- OneTap parking settlement
- Move+ marketplace settlement
- synthetic payment reconciliation
- synthetic contractor-payment integrity
- synthetic document authenticity and version verification

Any government-related demonstration must use synthetic data and clearly state:

> Prototype using synthetic data. No government affiliation, official record, or real public payment is represented.

## Phase 7 — Security and Mainnet Readiness

### Requirements

- registered legal entity
- independent legal and regulatory review
- validator-governance design
- multisig treasury controls
- production infrastructure budget
- independent smart-contract review
- validator and RPC security assessment
- incident-response plan
- disaster-recovery test
- data-privacy review
- application demand assessment
- explicit mainnet go/no-go decision

## Phase 8 — Controlled Mainnet

Mainnet will be considered only when:

- applications demonstrate a genuine need for dedicated infrastructure
- infrastructure funding is sustainable
- validator operations are reliable
- security reviews are complete
- governance responsibilities are documented
- production partners and users are clearly identified
- legal and regulatory requirements are addressed

The first mainnet release, when justified, is expected to remain controlled and permissioned.

## Long-Term Expansion

Possible later developments include:

- additional validators
- institutional validator operators
- more RPC capacity
- approved third-party applications
- additional payment and settlement modules
- Avalanche interchain connectivity
- gradual decentralization where appropriate

None of these developments are guaranteed and all remain subject to technical, security, economic, and legal review.
