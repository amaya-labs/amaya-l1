# Local Alpha runbook

Staged operational runbook for **Amaya Local Alpha**.
**TAMAYA is a valueless testnet asset used only for gas and network testing.**

> **Safety:** This runbook does not authorize unattended create/deploy.
> Commands that create, deploy, reset, or clean Avalanche networks are marked **approval required** and are intentionally omitted as executable steps here until explicitly approved.

## Topology reminder

- Local Alpha = **one sovereign Amaya L1 validator**.
- Avalanche CLI may also start supporting **Primary Network** nodes; those are **not** Amaya L1 validators.
- Supporting Primary Network nodes commonly use ports such as **9650** / **9652**.
- The Amaya L1 validator RPC commonly uses a **dynamically assigned localhost port**.
- **Never hard-code 9650 as the Amaya L1 RPC.** Discover the URL from deployment output.
- Keep Local Alpha on **localhost** only — do not bind or publish via `0.0.0.0`.
- Local interop tooling defaults do **not** authorize Amaya L1 bridges.

---

## Phase 0: Repository and environment preparation

1. Confirm working directory is the `amaya-l1` repository root.
2. Confirm you will not modify sibling repositories (including `moveplus_mainapp_web3`).
3. Copy `.env.example` to a local `.env` if needed; fill only non-secret placeholders later.
4. Ensure `.env` contains **no** private keys, recovery phrases, validator staking keys, or production credentials.
5. Run repository validation:

```bash
make validate
```

6. Review [SECURITY.md](../../SECURITY.md) and [key-separation.md](./key-separation.md).

**Exit criteria:** `make validate` completes with PASS (warnings documented if any).

---

## Phase 1: Avalanche CLI verification

1. Run read-only preflight:

```bash
make preflight
```

2. Confirm Avalanche CLI is detected (PATH or `$HOME/bin/avalanche`).
3. Record CLI version in your private operator notes (not secrets).
4. Review preflight status for ports **9650** and **9651** — these are common Avalanche **Primary Network / API** local ports, **not** a guarantee of the Amaya L1 RPC port.
5. Remember: the Amaya L1 RPC port is typically assigned dynamically and is known only after deployment.
6. Treat Docker as optional for this milestone; missing Docker is a warning, not a blocker.

**Exit criteria:** Preflight shows PASS or acceptable WARNINGs; CLI version known.

**Do not:** install packages, alter PATH, start/stop services, or run network clean commands in this phase.

---

## Phase 2: Deliberate Local Alpha configuration

1. Read [`config/local-alpha/network-spec.yaml`](../../config/local-alpha/network-spec.yaml).
2. Confirm intent: 1 Amaya L1 validator (`validator_scope: amaya-l1`), CLI-managed supporting Primary Network nodes, Subnet-EVM, PoA direction, TAMAYA, bridges off, localhost-only RPC discovery, no public faucet.
3. Plan the Amaya L1 validator identity as **Local Alpha only**—never reuse as future production validator or treasury.
4. Prepare offline notes for where genesis/evidence will live **outside** Git if sensitive.

**Approval required:** Avalanche blockchain **create** / configuration wizards that write chain definitions.

**Exit criteria:** Written plan for Local Alpha parameters; approval obtained before create.

---

## Phase 3: Local deployment

1. Obtain explicit human approval to deploy Local Alpha.
2. Perform deployment only with approved procedure (commands not embedded here yet).
3. Expect CLI-managed supporting Primary Network nodes plus **one** Amaya L1 validator; do not mis-count Primary Network nodes as Amaya L1 validators.
4. Capture the **Amaya L1 RPC URL** and public identifiers from the successful deployment output (do not invent ports).
5. Do not run `avalanche network clean` unless separately approved for a controlled reset.
6. Do not import/export wallets or touch Core Wallet recovery material as part of deploy.

**Approval required:** Avalanche blockchain **deploy** (and any equivalent start of the local network).

**Exit criteria:** Local Amaya L1 validator running per approved procedure; RPC URL discovered from output; no secrets committed.

---

## Phase 4: RPC verification

1. Use the **Amaya L1** RPC URL from the approved deployment output — not a hard-coded `9650` URL and not a Primary Network API port assumed to be the L1.
2. Confirm the URL is a **localhost** endpoint; do not rebind or expose via `0.0.0.0`.
3. Verify basic RPC health using read-only methods only (operator-chosen safe checks).
4. Record as public identifiers: `AMAYA_RPC_URL`, Blockchain ID, Subnet/L1 ID, EVM Chain ID, L1 validator Node ID, deployment timestamp, and component versions — never with keys.
5. Update non-secret evidence under `deployments/local-alpha/` per [deployment-records.md](./deployment-records.md).

**Exit criteria:** Amaya L1 RPC responds; identifiers recorded without secrets.

---

## Phase 5: Core network connection

1. Add/detect the Local Alpha network in Core Wallet using the recorded EVM chain ID and the **discovered Amaya L1 RPC URL**.
2. Use a **testing-only** development account—not a future treasury or validator identity.
3. Confirm the network appears and is selectable.
4. Do not screenshot recovery phrases, private keys, or QR secrets.

**Exit criteria:** Core Wallet shows Amaya Local Alpha; test account selected.

---

## Phase 6: TAMAYA transfer test

1. Confirm test account has TAMAYA for gas (valueless test asset only).
2. Execute a small transfer between testing-only accounts.
3. Confirm balance changes via wallet and/or Amaya L1 RPC read methods.
4. Record success/failure, timestamps, and transaction hash in deployment evidence (no keys).

**Exit criteria:** At least one successful TAMAYA transfer documented.

---

## Phase 7: Shutdown and evidence recording

1. Shut down local network components using the **approved** stop procedure for your install (do not invent destructive cleanups).
2. Complete the evidence checklist in [deployment-records.md](./deployment-records.md).
3. Note any WARNINGs from preflight/validate that remain relevant.
4. Confirm no secret files were added under the repository tree (`make validate`).

**Approval required** for destructive cleanup (for example network clean / database wipe).

**Exit criteria:** Evidence filed; working tree free of secrets; Local Alpha learnings captured for Fuji planning.

---

## Related

- [Preflight script](../../scripts/preflight.sh)
- [Incident response](./incident-response.md)
- [Architecture overview](../architecture/overview.md)
