# ADR-003: TAMAYA testnet asset

| Field | Value |
|---|---|
| Status | **Accepted for Local Alpha** |
| Date | 2026-07-18 |
| Decision makers | Amaya L1 infrastructure |

## Context

Local Alpha and early testnet operation need a native gas asset for transaction fees and transfer testing. Using language or processes that imply monetary value, investment, or a public sale would create legal and operational risk and confuse contributors.

## Decision

The native gas symbol for early Amaya L1 test environments is **TAMAYA**.

**TAMAYA is a valueless testnet asset used only for gas and network testing.**

- No monetary value
- Not an investment product
- Not offered via token sale, presale, or speculative listing language in this repository
- Public unrestricted faucet is disabled in Local Alpha; any later faucet must be controlled

## Consequences

**Positive**

- Clear testing symbol for Core Wallet and application fee flows
- Reduces ambiguity about asset purpose in docs and configs
- Aligns `.env.example` and `network-spec.yaml` with a single symbol

**Negative / costs**

- Contributors may still misuse “token” language; docs must stay explicit
- Separate mainnet gas/asset decisions will need their own ADR when relevant

## Security implications

- Holding TAMAYA does not justify storing production keys on development machines
- Faucet or mint controls, when introduced, must not share treasury or validator identities
- Do not embed funded production wallets in scripts or CI

## Revisit conditions

Revisit this ADR if:

- A later environment adopts a different gas symbol or dual-asset model
- Controlled faucet policy changes for public testnet expansion
- Mainnet native asset policy is defined (expects a new ADR, not silent reuse of TAMAYA assumptions)
