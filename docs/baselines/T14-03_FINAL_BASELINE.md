# T14-03 FINAL BASELINE

## Atomic Authorized Direct GERAM Issuance & Direct NFT Delivery

**Status:** PASS / CLOSED / FROZEN

**Repository:** geram-icp/geram

**Branch:** main

**Implementation Commit:** 205f449

**Commit Message:** feat(p2): finalize atomic GERAM issuance and direct delivery

---

## 1. Purpose

T14-03 establishes the canonical issuance boundary for GERAM.

GERAM issuance is a controlled canonical operation that creates the GERAM
economic record and its authorized RWA-NFT representation while preserving
the separation of responsibilities between GERAM Core, ICRC-7 ownership,
NFID.ONE and specialized financial services.

The canonical sequence is:

Approved Issuance Request
? Complete Validation
? Reserve GERAM ID Candidate
? Validate Legal / Contractual Basis
? Mint RWA-NFT Directly to Initial Holder
? Create Canonical GERAM Record
? Create Certificate Registry Record
? Commit Allocators
? Return Successful Issuance Result

---

## 2. Architectural Position

GERAM remains the canonical economic-value record.

GERAM records the value; it does not become the financial service.

GERAM is not:

- a bank;
- a lender;
- a fund;
- a financial intermediary;
- a marketplace;
- a payment processor;
- an exchange;
- a guarantee executor;
- a settlement engine;
- an NFT marketplace;
- a wallet provider.

---

## 3. Required Legal / Contractual Basis

Every GERAM issuance requires a valid legal, contractual or authorized
legal basis.

The request field external_reference is required.

Missing or empty external_reference is rejected before the irreversible
ICRC-7 Mint operation.

The canonical GERAM field is:

legal_basis_reference

This prevents creation of a canonical GERAM record without the required
legal or contractual foundation.

---

## 4. Validation Before Irreversible State Change

All business validations capable of returning an error occur before the
irreversible Mint boundary.

After successful ICRC-7 Mint, no remaining business validation is allowed
to return an issuance error before canonical registry completion.

This is required because Motoko state mutations do not automatically roll
back when a later operation returns an error.

---

## 5. GERAM ID Candidate

T14-03 obtains the candidate GERAM ID from:

currentGeramId()

The candidate is checked against the canonical GERAM registry.

A duplicate GERAM ID candidate is rejected before Mint.

The allocator itself is not advanced merely because a candidate was examined.

---

## 6. Direct RWA-NFT Delivery

The RWA-NFT is minted directly to:

request.initial_holder

No issuer-owned intermediate NFT wallet is used in the canonical issuance
path.

The resulting ownership is therefore established directly by ICRC-7.

---

## 7. Ownership Source of Truth

ICRC-7 is the canonical source of truth for current RWA-NFT ownership.

GERAM Core does not maintain a competing NFT ownership registry.

Verified positive issuance:

Token ID: 1_000_009
Owner: 2vxsx-fae

The live ICRC-7 owner query confirmed the initial holder.

---

## 8. Canonical GERAM Record

The canonical GERAM record contains:

- geram_id
- issuance_id
- project_id
- asset_id
- legal_basis_reference
- current_status
- created_at
- updated_at

A newly issued GERAM begins with:

current_status = ACTIVE

---

## 9. Certificate Relationship

The Certificate is an issuance registry representation.

It does not replace the canonical GERAM record.

For T14-03:

issuance_id = certificate_id

GERAM remains the canonical economic record.

---

## 10. GERAM / RWA-NFT Relationship

T14-03 establishes the issuance-side relationship by creating the RWA-NFT
representation.

Formal one-to-one identity verification is the subject of T14-04.

T14-04 must begin from the frozen T14-03 baseline.

---

## 11. Verified Positive Issuance

Certificate ID:

T14-03-POSITIVE-NEW-001

Token ID:

1_000_009

Transaction ID:

8

Project ID:

F18-03-PROJECT-001

Initial Holder:

2vxsx-fae

Legal Basis:

LEGAL-BASIS-T14-03-POSITIVE-NEW-001

QR Reference:

T14-03-POSITIVE-NEW-QR-001

Asset Type:

GENERAL

Base Value:

500,000,000

ICP Value:

1

Currency:

IRR

The issuance returned success and created the expected RWA-NFT and
canonical registry records.

---

## 12. Negative Tests

The following negative cases were verified:

1. external_reference = null
2. external_reference = empty
3. duplicate certificate
4. invalid project
5. invalid asset
6. maturity <= current time
7. zero ICP value
8. zero base value

Each invalid request was rejected before successful issuance.

NFT supply remained unchanged during the negative tests.

---

## 13. Supply Integrity

NFT supply before final positive issuance:

8

NFT supply after final positive issuance:

9

Therefore exactly one new RWA-NFT was created by the successful issuance.

---

## 14. Registry Commit Ordering

After successful Mint:

1. Construct Certificate value.
2. Construct GERAM value.
3. Append GERAM registry record.
4. Append Certificate registry record.
5. Advance GERAM allocator.
6. Advance NFT token allocator.
7. Return success.

No remaining business validation capable of returning an issuance error is
performed between successful Mint and registry completion.

---

## 15. Mint Failure Handling

ICRC-7 Mint failure is handled explicitly.

The implementation handles:

- rejected Mint;
- missing transaction ID;
- generic ICRC-7 error.

These failures return an issuance error before GERAM and Certificate
registry creation.

---

## 16. Allocator Commit Rule

The GERAM allocator uses the current candidate and advances only after
successful Mint and registry creation.

The final allocator operation is:

nextGeramId += 1

The NFT token allocator is likewise advanced only after successful
issuance.

---

## 17. Lifecycle

New GERAM records begin in:

ACTIVE

The frozen lifecycle remains:

ACTIVE ? MATURED ? SETTLED ? RETIRED

MATURED remains a live state and is not equivalent to EXPIRED, SETTLED or
RETIRED.

---

## 18. Post-Issuance Neutrality

After successful issuance, GERAM Core does not interfere with specialized
services such as HamiFund, FlowChain, Marketplace or external settlement
systems.

GERAM participates again only when a canonical lifecycle event requires a
GERAM state transition.

---

## 19. Financial-Service Boundary

T14-03 does not turn GERAM into a financial service.

Economic metadata such as face value, base value, annual return and risk
level does not constitute a guaranteed market return.

Maturity liquidity and guaranteed market price remain separate concepts.

---

## 20. Source-of-Truth Boundaries

Canonical GERAM economic record:
GERAM Core

RWA-NFT existence and ownership:
ICRC-7

Identity and wallet:
NFID

Specialized financing:
HamiFund

Specialized settlement:
External authorized systems

Physical certificate:
Certificate / NFID operational layer

---

## 21. Build Verification

Final verified WASM:

Size:
1,117,783 bytes

SHA256:

2ede77b612bbfed37089239624a02270c88ed025c15bb2745a2c526c6ad5925d

The local WASM hash matched the previously verified live module hash.

---

## 22. Source Integrity

Final backend source SHA256:

1a5f4501320697b00f72b540e46b5fe1e352692cd78ccd58cc4471ca33bf4a21

The T14-03 implementation was audited for:

- legal-basis validation;
- GERAM ID candidate handling;
- duplicate GERAM protection;
- Mint ordering;
- direct NFT delivery;
- post-Mint mutation ordering;
- registry creation;
- allocator commit.

---

## 23. Implementation Commit

Commit:

205f449

Message:

feat(p2): finalize atomic GERAM issuance and direct delivery

---

## 24. GitHub Synchronization

The implementation commit was successfully synchronized with origin/main.

Previous remote:

38f4be3

Implementation release:

205f449

Final expected state:

LOCAL = REMOTE = 205f449
AHEAD = 0

---

## 25. Temporary Development Files

Historical backup and temporary files in the repository are intentionally
excluded from the T14-03 release.

They must not be deleted, staged or committed as part of this documentation
release.

---

## 26. T14-03 Acceptance Criteria

| Criterion | Status |
|---|---|
| Legal basis required | PASS |
| Empty legal basis rejected | PASS |
| Duplicate GERAM candidate rejected | PASS |
| Validation before Mint | PASS |
| Direct NFT delivery | PASS |
| Initial holder ownership verified | PASS |
| GERAM record created | PASS |
| Certificate record created | PASS |
| GERAM allocator committed after success | PASS |
| NFT allocator committed after success | PASS |
| Mint failures handled | PASS |
| No post-Mint business error path | PASS |
| Negative tests completed | PASS |
| Positive issuance completed | PASS |
| WASM integrity verified | PASS |
| Source integrity verified | PASS |
| Git implementation committed | PASS |
| GitHub implementation synchronized | PASS |

---

## 27. Final Status

T14-03 = PASS / CLOSED / FROZEN

This document is the formal documentation baseline for T14-03.

No further T14-03 implementation change should be made unless a formal
Change Request is opened.

---

## 28. Next Stage

T14-04

GERAM ? RWA-NFT 1:1 Identity

T14-04 begins from this frozen T14-03 baseline.

---

## 29. Final Statement

T14-03 establishes a controlled and auditable issuance boundary:

Legal Basis
? Validated Issuance
? Reserved GERAM Candidate
? Direct ICRC-7 Mint
? Canonical GERAM Record
? Certificate Registry
? Allocator Commit

GERAM remains the canonical economic-value record while ownership, identity,
wallet, financing, marketplace and settlement responsibilities remain in
their designated specialized layers.

T14-03 is CLOSED and FROZEN.
