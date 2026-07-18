# ADR-001: Permissioned Avalanche L1

| Field | Value |
|---|---|
| Status | **Accepted for Local Alpha** |
| Date | 2026-07-18 |
| Decision makers | Amaya L1 infrastructure |

## Context

Amaya L1 must support mobility and transport applications (Move+, Move+ Marketplace, OneTap, and approved institutional integrations) with predictable operational control. An unrestricted public L1 or open subnet would invite arbitrary token deployment, uncontrolled validators, and early bridge pressure that conflict with the project’s non-goals.

Avalanche’s L1 / subnet model with Subnet-EVM allows a dedicated execution environment while keeping participation and policy under operator control.

## Decision

Amaya L1 will be operated as a **permissioned Avalanche L1** using **Subnet-EVM**.

- Validator participation is controlled.
- Network access and application onboarding are gated by policy.
- Local Alpha, Fuji, and mainnet remain separately configured environments.
- Public token-launch and unrestricted third-party fungible-token platforms are out of scope.

## Consequences

**Positive**

- Clear operational ownership of the validator set and network policy
- Better alignment with sponsored-gas and institutional integration models
- Reduced surface for speculative token spam on the early network

**Negative / costs**

- Requires deliberate validator and access management
- Not a permissionless public settlement layer for arbitrary apps
- Onboarding friction for partners who expect fully open networks

## Security implications

- Compromised deployer or admin keys have outsized impact; role separation is mandatory.
- Permissioning does not remove the need for key hygiene, backups, and incident response.
- Development identities must never promote into production validator or treasury roles.

## Revisit conditions

Revisit this ADR if:

- A later milestone explicitly requires broader public validator participation with documented controls
- Regulatory or partner requirements mandate a different permissioning model
- Avalanche platform capabilities change in a way that alters the L1 operational model

Any change requires a new or superseding ADR, updated runbooks, and explicit approval before deployment impact.
