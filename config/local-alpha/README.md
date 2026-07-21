# Local Alpha configuration

Declarative, non-secret specification for the **Amaya Local Alpha** milestone.

| Item | Value |
|---|---|
| Spec file | [`network-spec.yaml`](./network-spec.yaml) |
| Environment | `local-alpha` |
| Amaya L1 validators | **1** (sovereign Local Alpha validator) |
| Supporting Primary Network nodes | CLI-managed (not Amaya L1 validators) |
| VM | Subnet-EVM |
| Consensus direction | Proof of Authority |
| Native gas symbol | TAMAYA (valueless; testing only) |
| Amaya L1 RPC | Discovered at deployment; localhost-only; dynamic port |
| Bridges | Disabled |
| Public faucet | Disabled |

## Local topology (Avalanche CLI)

Local Alpha counts **one Amaya L1 validator**. Avalanche CLI may also start supporting **Primary Network** nodes for the local test harness. Those Primary Network nodes are **not** additional Amaya L1 validators.

Current Avalanche CLI local deployments commonly use:

- Supporting Primary Network nodes on local ports such as **9650** / **9652**
- One Amaya L1 validator node on a **dynamically assigned localhost port**

Port assignments and local topology are **implementation details** and may change between Avalanche CLI versions. **Never hard-code port 9650 as the Amaya L1 RPC.**

The Amaya L1 RPC URL must be taken from **successful deployment output**, then recorded as a public identifier. Local Alpha remains **localhost-only**—do not expose it via `0.0.0.0`.

Interop tooling that may appear in a default local test configuration does **not** authorize bridges. Amaya L1 has no bridge integration during Local Alpha or early testnet.

## Purpose

This directory holds **intent and policy** for Local Alpha before and after deliberate chain creation. It is not Avalanche CLI state and must not contain genesis secrets, staking keys, or wallet material.

## Post-deployment records

After an **approved** create/deploy:

1. Capture public identifiers only: Blockchain ID, Subnet/L1 ID, EVM Chain ID, Amaya L1 RPC URL (from deploy output), L1 validator Node ID, deployment timestamp, and component versions.
2. Store operational evidence per [docs/operations/deployment-records.md](../../docs/operations/deployment-records.md).
3. Place non-secret deployment artifacts under `deployments/local-alpha/` only.

## Verified Local Alpha Deployment

The current public-safe verification artifacts for Amaya Local Alpha are:

- [Markdown verification report](../../docs/operations/local-alpha-verification-2026-07-20.md)
- [YAML deployment summary](../../deployments/local-alpha/2026-07-20-summary.yaml)

These files intentionally contain only sanitized public identifiers, localhost RPC information, version data, and verification outcomes. Generated Avalanche CLI state, node databases, keystores, staking/signing keys, and other sensitive material remain outside Git and are **not** represented by these public summaries.

## Related

- [Local Alpha runbook](../../docs/operations/local-alpha-runbook.md)
- [ADR-001](../../docs/decisions/ADR-001-permissioned-avalanche-l1.md)
- [ADR-003](../../docs/decisions/ADR-003-tamaya-testnet-asset.md)
- [ADR-004](../../docs/decisions/ADR-004-no-early-bridges.md)
