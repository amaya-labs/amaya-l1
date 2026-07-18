# ADR-002: Proof of Authority

| Field | Value |
|---|---|
| Status | **Accepted for Local Alpha** |
| Date | 2026-07-18 |
| Decision makers | Amaya L1 infrastructure |

## Context

Local Alpha and early testnet phases prioritize operational simplicity, small validator counts, and clear identity of block producers. Proof of Stake and larger dynamic validator sets introduce complexity (staking economics, sybil considerations, and operational overhead) that is not required for proving RPC, wallet connectivity, and application smoke tests.

## Decision

Amaya L1’s **initial consensus direction** is **Proof of Authority (PoA)**.

- Local Alpha: **1** local validator
- Persistent Fuji (planned): **1** persistent self-hosted validator under PoA direction unless superseded
- Public testnet expansion (planned): **3** validators still under controlled / PoA-oriented operation unless a later ADR changes course

This ADR records direction for early milestones; it does not freeze mainnet economics forever.

## Consequences

**Positive**

- Fast path to a working Local Alpha with a single validator
- Straightforward operational model for early monitoring and incident response
- Clear mapping between validator identity and authorized operators

**Negative / costs**

- Trust concentrated in authorized validators
- Less suitable as a narrative of fully decentralized consensus in early phases
- Validator key compromise is high severity

## Security implications

- Validator/node identity must be isolated from deployer, treasury, and relayer roles.
- Validator staking/signing material must never enter Git or development wallet backups casually.
- Authority changes (add/remove validators) require approval, runbook updates, and evidence.

## Revisit conditions

Revisit this ADR if:

- Public testnet or mainnet requires a different consensus or staking model
- Validator count or geography demands stronger economic security assumptions
- Platform defaults or Avalanche L1 tooling make an alternative clearly superior

Changes affecting live networks require approval, migration and rollback plans, and verification procedures.
