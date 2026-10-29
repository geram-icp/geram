# ZAR Architecture Decision Log

Record each decision with date, status, context, decision, alternatives, consequences, approver, and supporting evidence.

## Open decisions

### ZAR-ADR-001 — Supply cap and burn semantics
- Status: Proposed; approval required.
- Context: Initial target supply is 133,000,000,000,000 ZAR with 3 decimals.
- Decision required: Whether burned units permanently consume the lifetime issuance budget.
- Recommended safety default: track cumulative minted units and prevent cumulative issuance from exceeding the approved cap.
- Evidence required: implementation review and adversarial tests.

### ZAR-ADR-002 — Ledger implementation
- Status: Open.
- Decision required: Select one supported ICRC ledger implementation and remove ambiguity among duplicate configurations.
- Evidence required: toolchain compatibility, build provenance, interface review, and test results.

### ZAR-ADR-003 — Governance and controller authority
- Status: Open.
- Decision required: Define treasury custody, mint policy, canister controllers, upgrade approvals, and emergency actions.
- Evidence required: role matrix, key-management procedure, and controller review.

### ZAR-ADR-004 — Initial allocation
- Status: Open.
- Decision required: Approve initial recipient(s), allocation schedule, vesting/lockup terms, and custody arrangement.
- Evidence required: written approval and independently checked initialization arguments.
