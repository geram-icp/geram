# ZAR Security Model

## Security objectives

Protect token balances, supply invariants, treasury assets, controller authority, user privacy, and the integrity of releases and audit evidence.

## Minimum controls

- Least privilege and separation of duties.
- Separate treasury custody from mint-policy authority.
- Restrict canister controllers and review every controller change.
- Require multi-party approval for high-impact changes where technically feasible.
- Never store seed phrases, private keys, identity passwords, API tokens, or recovery codes in Git.
- Use environment-specific configuration and secret stores; commit only sanitized examples.
- Pin and review dependencies and compiler/toolchain versions.
- Build reproducibly where possible and record source commit, toolchain, Wasm hash, and test report.
- Test authorization failures, overflow, reentrancy/inter-canister assumptions, upgrade paths, and state migration.
- Monitor cycles, canister status, controller changes, ledger supply, and unusual administrative activity.
- Maintain an incident-response plan and tested recovery procedure.

## Threats to test

1. Unauthorized mint or burn.
2. Supply-cap bypass through alternate entry points.
3. Overflow or arithmetic precision errors.
4. Compromised deployment identity or controller.
5. Malicious or mistaken upgrade.
6. Incorrect initial recipient or amount.
7. Fee configuration errors.
8. Allowance abuse if ICRC-2 is enabled.
9. Archive or transaction-history failures.
10. Misleading valuation, backing, or legal-right claims.
11. Compromised dependency or build artifact.
12. Secrets accidentally included in commits, CI logs, or generated reports.

## Incident handling

On suspected compromise: stop nonessential administrative actions, preserve non-secret evidence, verify current controllers and balances independently, revoke or rotate affected credentials through the approved procedure, and publish a factual incident report. Do not put secrets in the incident report.

## Audit status

No independent security audit is claimed by this document. Audit findings, fixes, and retest evidence must be linked here only when they exist.
