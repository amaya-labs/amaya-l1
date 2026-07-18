# ADR-004: No early bridges

| Field | Value |
|---|---|
| Status | **Accepted for Local Alpha** |
| Date | 2026-07-18 |
| Decision makers | Amaya L1 infrastructure |

## Context

Bridges expand attack surface (message verification, liquidity, key custody, and operational complexity). Early Amaya L1 milestones focus on local validation, permissioned operation, and application smoke tests. Enabling bridges prematurely would conflict with explicit non-goals and increase incident severity before monitoring and key separation are mature.

## Decision

**Bridges are disabled for Local Alpha and early testnet phases.**

- `bridges_enabled: false` in Local Alpha network specification
- No bridge contracts, relayers, or liquidity programs as part of early milestone scope
- Cross-chain asset movement is out of scope until a superseding ADR and operational readiness review

## Consequences

**Positive**

- Smaller security and operational perimeter during Local Alpha and early Fuji
- Forces applications to design for a dedicated permissioned network first
- Avoids premature dependence on external bridge operators

**Negative / costs**

- Applications cannot move assets to/from other chains in early phases
- Partner expectations for interoperability must wait for a later, deliberate decision

## Security implications

- Reduces early exposure to bridge-key and message-forgery classes of incidents
- Does not eliminate the need for RPC, validator, and relayer hardening
- Any future bridge introduction is a high-risk change requiring threat modeling, key separation, runbooks, and rollback plans

## Revisit conditions

Revisit this ADR if:

- Public testnet or mainnet explicitly requires controlled interoperability
- A partner integration cannot proceed without a narrowly scoped bridge
- Independent security review clears a specific bridge design and operator model

Bridge enablement requires a new ADR, approval, and updated incident-response procedures—never a silent config flip.
