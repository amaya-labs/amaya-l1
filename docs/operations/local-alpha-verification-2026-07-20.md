# Amaya Local Alpha Verification Record

## Executive status

| Field | Value |
|---|---|
| Project | Amaya L1 |
| Environment | Local Alpha |
| Internal CLI blockchain name | `amayalocalalpha` |
| Status | Local Alpha milestone successfully verified |
| Permission model | Permissioned |
| Validator management | Proof of Authority |
| Validator Manager protocol | V2 |

**TAMAYA is a valueless Local Alpha/testnet asset used only for gas and network testing.**

“Amaya Local Alpha successfully demonstrated a permissioned Proof of Authority Avalanche L1 with a functioning sovereign validator, localhost RPC, Core wallet detection, native TAMAYA gas transfers, and persisted state across a controlled stop and restart.”

## Scope

This record documents a **public-safe, sanitized** Local Alpha verification for Amaya L1. It covers chain identity, localhost RPC verification, wallet validation, native TAMAYA transfer tests, and state persistence across a controlled stop and restart.

It does **not** publish private keys, recovery phrases, wallet exports, staking or signing material, cloud credentials, SSH details, private inventories, or generated Avalanche CLI state. It does not represent a production, public, permanent, or 24/7 network.

## Versions

| Component | Version |
|---|---|
| Avalanche CLI | `v1.9.6` |
| AvalancheGo | `v1.14.0` |
| Subnet-EVM | `v0.8.0` |

## Chain identity

| Field | Value |
|---|---|
| Chain ID (decimal) | `113125101` |
| Chain ID (hex) | `0x6be26ed` |
| Native token symbol | `TAMAYA` |
| Native token name | `TAMAYA Token` |
| Subnet/L1 ID | `2W9boARgCWL25z6pMFNtkCfNA5v28VGg9PmBgUJfuKndEdhrvw` |
| Blockchain ID | `LdgDLxwwTLXbtgPoaKZzvDeXxztcH7YcYsj9UGuwJYt4KqC2h` |
| VM ID | `juedcZYhN5PonV88CSXAHCs67uETLUgkSJdmsm4JJu8wFWyq7` |
| Amaya L1 validator NodeID | `NodeID-BQFDEYcGdX7YzKFtNM6bx5Y7coXQ7fpdk` |

## Local topology

| Field | Value |
|---|---|
| Total local AvalancheGo nodes | `3` |
| Supporting Primary Network nodes | `2` |
| Sovereign Amaya L1 validator nodes | `1` |
| Public RPC | Not available |
| Explorer / indexer | Not deployed |

The two supporting Primary Network nodes are **not** additional Amaya validators.

## RPC and health checks

| Field | Value |
|---|---|
| Local-only RPC | `http://127.0.0.1:9654/ext/bc/LdgDLxwwTLXbtgPoaKZzvDeXxztcH7YcYsj9UGuwJYt4KqC2h/rpc` |
| RPC host scope | Localhost only |
| Network healthy | `true` |
| Blockchains healthy | `true` |
| Number of blockchains | `1` |
| Verified latest block after restart | `0xa` |
| `eth_chainId` | `0x6be26ed` |
| `eth_blockNumber` | `0xa` |

Local Alpha is bound to localhost and is not publicly reachable.

## Core wallet verification

| Check | Result |
|---|---|
| Core detected Amaya Local Alpha | Success |
| Core displayed native TAMAYA balance | Success |
| Core signed and broadcast native TAMAYA transfer | Success |

The wallet used for validation is referenced only as `Core Local Alpha development account`. The full address is intentionally omitted from this public repository.

### Core UX note

Core displayed a transaction pre-execution warning on the custom localhost network. The signed transaction nevertheless succeeded and was confirmed by RPC receipt. Core's Activity view did not display indexed history because Local Alpha has no explorer/indexer. This is **not** treated as a chain failure.

## Native TAMAYA transaction tests

**TAMAYA is a valueless Local Alpha/testnet asset used only for gas and network testing.**

| Transaction | Direction | Amount | Hash | Receipt status | Block | Gas used |
|---|---|---:|---|---|---|---|
| 1 | Local prefunded development account -> `Core Local Alpha development account` | `100 TAMAYA` | `0x405aa893c608138f296794fd2a2c79c1d28f7c10696d9e8ed66ab87a7048aba3` | `0x1` | `0x9` | `0x5208` / `21000` |
| 2 | `Core Local Alpha development account` -> Local prefunded development account | `1 TAMAYA` | `0x81739d64c9c46b91276efb11f4631e6fe20508efe209bda092e2cafd0a8401ba` | `0x1` | `0xa` | `0x5208` / `21000` |

### Post-transaction verification

| Check | Result |
|---|---|
| Core development account balance after return transfer and gas | `98.999412 TAMAYA` |
| Both receipts remained available after restart | Yes |
| Blockchain ID, Chain ID, validator NodeID, RPC endpoint, balance, and transaction history remained intact | Yes |

## Stop/restart persistence test

State persisted after a graceful `network stop` and `network start`. This record does not reproduce raw terminal output or operational internals, but the public verification result is:

| Check | Result |
|---|---|
| Controlled stop completed | Success |
| Controlled restart completed | Success |
| Latest verified block after restart | `0xa` |
| Receipt availability after restart | Preserved |
| Chain identity after restart | Preserved |

## Known Local Alpha limitations

- Local Alpha is bound to localhost only.
- It is not publicly reachable.
- It is not a persistent cloud validator.
- It may become unavailable when the machine sleeps, shuts down, or restarts.
- Public RPC is not available.
- Explorer/indexer is not deployed.
- No public faucet exists.
- No bridge is enabled or authorized.
- CLI-installed ICM development tooling does not change the no-bridge policy.

## Security and public-disclosure statement

- No production credentials were used.
- No Fuji or Mainnet deployment occurred.
- Generated Avalanche CLI state and keys remain outside Git.
- No private keys, recovery phrases, wallet exports, staking keys, signing keys, BLS secret material, API tokens, cloud credentials, or SSH information are included here.
- Government examples remain synthetic research/demo material only.
- Project Agilus remains excluded.

Real infrastructure inventories and operational records belong in the private `amaya-l1-ops` repository, not this public repository.

## Result

Amaya Local Alpha successfully verified:

- one sovereign permissioned Amaya L1 validator
- localhost-only RPC reachability
- Core wallet network detection
- native TAMAYA balance visibility
- successful TAMAYA transfer in both directions
- state persistence across a controlled stop and restart

“Amaya Local Alpha successfully demonstrated a permissioned Proof of Authority Avalanche L1 with a functioning sovereign validator, localhost RPC, Core wallet detection, native TAMAYA gas transfers, and persisted state across a controlled stop and restart.”

## Next milestone: persistent single-validator Fuji testnet

The next milestone is a **persistent single-validator Fuji testnet** with:

- permissioned access
- dedicated Fuji RPC planning
- monitoring and backups
- the same separation of validator, deployer, treasury, relayer, monitoring, and cloud roles

This Local Alpha verification does not imply public availability, permanent uptime, or bridge authorization.
