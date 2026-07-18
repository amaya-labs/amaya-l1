# Incident response

Operational guidance for Amaya L1 infrastructure incidents. Keep responses proportional; never paste secrets into GitHub issues, chat logs, or this repository.

## Severity overview

| Severity | Examples | Initial posture |
|---|---|---|
| **Critical** | Validator key compromise; treasury key compromise; unauthorized admin action | Isolate, rotate, halt risky ops |
| **High** | Relayer key compromise; RPC credential leak; unauthorized deploy | Revoke/rotate, assess chain impact |
| **Medium** | Monitoring failure; disk pressure; non-secret config error | Stabilize, document, schedule fix |
| **Low** | Doc drift; preflight warnings | Track and remediate |

## Immediate actions (all severities)

1. **Stop spreading secrets** — do not commit, screenshot, or paste keys/phrases.
2. **Preserve evidence** — timestamps, public tx hashes, NodeIDs, RPC errors (non-secret).
3. **Identify role scope** — which separated role is affected (validator, deployer, treasury, Move+ relayer, OneTap relayer, monitoring, cloud).
4. **Avoid destructive cleanup** unless approved (`network clean`, disk wipes, etc.).

## Key-compromise response

If a private key, mnemonic, staking key, or keystore may be exposed:

1. Treat the identity as **untrusted**.
2. Rotate or replace according to the role (validator set change, relayer replacement, treasury movement under dual control).
3. Revoke cloud credentials if the same incident may have touched infrastructure access.
4. Audit recent admin actions and deployments.
5. Record a non-secret incident summary under operator evidence (not in public issues if sensitive).
6. Do **not** reuse the compromised key for any other role or environment.

## Local Alpha specifics

- Prefer shutting down the local network via the approved stop procedure.
- Re-create Local Alpha identities rather than “patching” a leaked test key into continued use if compromise is plausible.
- Development Core Wallet accounts used for testing are disposable—abandon on suspicion of exposure.

## Reporting

- Report infrastructure incidents to the Amaya L1 operators through the private channel defined by the team.
- For repository security issues, follow [SECURITY.md](../../SECURITY.md).
- Never include recovery phrases, private keys, or credentials in tickets.

## Post-incident

1. Update runbooks if procedure gaps appeared.
2. Confirm role separation still holds (no emergency dual-use keys left in place).
3. Schedule ADR revisit if architecture assumptions failed.
4. Run `make validate` before the next commit candidate.

## Related

- [Key separation](./key-separation.md)
- [SECURITY.md](../../SECURITY.md)
- [Local Alpha runbook](./local-alpha-runbook.md)
