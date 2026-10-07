# GERAM Project Guide

## 1. What GERAM Is

GERAM means:

**Global Economic Real Asset Mechanism**

GERAM is a governed digital infrastructure for registering, verifying, valuing, tracking and financially utilizing real-world and contract-backed economic value.

GERAM is not merely:

- an NFT platform
- a token
- a wallet
- a marketplace
- a lending application
- a blockchain database
- an AI application

Its central architectural principle is:

> **One Canonical GERAM Record, Many Specialized Services.**

GERAM connects real-world economic value to a controlled digital lifecycle while preserving the difference between legal ownership, economic rights, digital representations, financial exposure and technical execution.

---

## 2. The Main Architecture

The ecosystem consists of specialized domains.

### GERAM Core

GERAM Core is the canonical economic record.

It manages the authoritative GERAM-side representation of:

- Projects
- Assets
- Contracts
- Evidence references
- Verification
- Valuation
- Collateral
- Certificates
- Economic Rights
- Lifecycle information

GERAM Core does not replace the legal or regulatory authority of external institutions.

### NFID

NFID is the Identity, Account, Wallet and Rights operating layer.

It manages the participant context required to interact with GERAM and other ecosystem services.

The conceptual flow is:

Identity
? Account
? Wallet
? Signer
? Authorization
? Signature
? Domain Action

NFID is not the master database of every ecosystem domain.

### HamiFund

HamiFund is the financial services layer.

It can provide, where legally permitted:

- Funds
- Credit
- Lending
- Borrowing
- Liquidity
- Financial exposure
- Risk analysis
- Capital allocation
- Financial workflows

GERAM knows the asset.

HamiFund knows the financial exposure.

### FlowChain

FlowChain provides exchange, clearing, settlement, liquidity routing and financial connectivity.

It does not become the authoritative owner of GERAM asset state.

### ICPCooperative

ICPCooperative is the independent guarantee and protection layer.

Guarantee is intentionally separated from collateral and liquidity backing.

### zkEVM

zkEVM provides programmable execution and proof infrastructure.

It is an execution layer, not the canonical GERAM economic registry.

### ISO 20022

ISO 20022 is the financial messaging and interoperability layer.

It provides a standardized language for communication between financial systems.

It is not the business authority of GERAM.

### Indexer

The Indexer provides scalable search, indexing and explorer workloads.

The Indexer is not the Source of Truth.

### Analytics and AI

Analytics and AI provide:

- analysis
- prediction
- anomaly detection
- risk analysis
- recommendations
- scenario analysis

AI does not independently authorize critical financial actions.

> **AI Recommendation != Authorization**

---

## 3. The Real-World Truth Chain

GERAM follows this fundamental chain:

Real World
? Evidence
? Authorized Verification
? GERAM Record
? Digital Representation
? Valuation
? Economic Right / Collateral
? Financial Utilization
? Settlement
? Reconciliation
? Audit

The blockchain does not create real-world truth.

Evidence and authorized verification establish the basis for the digital record.

---

## 4. Project

A Project represents the economic or business context in which assets, contracts, evidence, valuations and rights exist.

A simplified relationship is:

Project
? Asset
? Evidence
? Verification
? Valuation
? Financial Relationship

A project may contain assets from different sectors.

---

## 5. Asset

An Asset represents an eligible real-world asset or economic resource.

GERAM is designed to support domains including:

- Energy
- Housing
- Production
- Logistics
- Tourism
- Infrastructure
- Technology
- Other eligible real-world economic sectors

An Asset is not automatically:

- an NFT
- a token
- a financial product
- legal ownership

These relationships must be explicitly established.

---

## 6. Contract

A Contract records the contractual and legal foundation of an economic relationship.

A Contract record may contain:

- Contract ID
- Contract number
- Project ID
- Contract type
- Version
- Parties
- Legal basis
- Document hash
- Effective timestamp
- Expiry timestamp
- Status

A legal contract record is not the same thing as a blockchain smart contract.

The legal contract establishes the legal/economic basis.

A smart contract executes machine-readable rules.

---

## 7. Evidence

Evidence supports the factual basis of a GERAM record.

Evidence may include:

- Documents
- Certificates
- Measurements
- Reports
- External references
- Attestations
- Technical records

Evidence should be versioned and integrity-protected.

---

## 8. Verification

Verification records an authorized verification decision.

The verification layer answers:

- What was verified?
- Which evidence was used?
- Who verified it?
- When was it verified?
- What was the result?

GERAM prevents a verification from silently referencing evidence belonging to another subject.

---

## 9. Valuation

Valuation records the economic value of a subject at a specific point in time.

Valuation is versioned.

Historical valuation is not overwritten.

A valuation can contain:

- Valuation ID
- Subject type
- Subject ID
- Project ID
- Base value
- Valuation unit
- Valuation date
- Expert reference
- Methodology
- Document hash
- Status
- Version
- Created timestamp

The principle is:

> **Valuation is time-bound and versioned.**

---

## 10. Collateral

Collateral represents an asset or economic interest supporting an obligation.

Collateral is different from:

- Economic Right
- Guarantee
- Liquidity
- Legal ownership

Collateral can contain:

- Official reference
- Authentication code
- Valuation reference
- Collateral value
- Coverage
- Priority
- Status
- Effective timestamp
- Release timestamp

The system must prevent unauthorized double collateralization.

---

## 11. GERAM Certificate

A GERAM Certificate is a structured and verifiable representation associated with a GERAM record.

It may contain:

- Certificate ID
- Token ID
- Project
- Issuer
- Initial holder
- Issue timestamp
- Maturity
- Face value
- Base value
- Currency
- ICP value
- ICP valuation timestamp
- Annual return terms
- Risk level
- Physical certificate reference
- QR reference

A certificate is not automatically legal ownership.

A certificate is not automatically a financial product.

---

## 12. NFT Representation

The NFT is a digital representation layer.

ICRC-7 provides the NFT ownership interface.

The architecture deliberately does not create a second NFT ownership registry inside GERAM.

The principle is:

> **ICRC-7 Ownership remains separate from EconomicRight.**

This prevents the system from confusing digital token ownership with contractual economic rights.

---

## 13. EconomicRight

EconomicRight identifies an economic entitlement and its current beneficiary.

It contains concepts such as:

- Right ID
- Certificate ID
- Project ID
- Contract ID
- Beneficiary
- Rights type
- Entitlement
- Entitlement unit
- Status
- Version
- Created timestamp
- Updated timestamp

EconomicRight is intentionally separate from NFT ownership.

Therefore:

NFT Ownership
!= EconomicRight
!= Legal Ownership

---

## 14. Assignment

Assignment records a proposed transfer of an EconomicRight.

The source beneficiary and destination beneficiary are explicitly recorded.

The initial state is:

PENDING

Assignment does not immediately change the EconomicRight beneficiary.

---

## 15. Acceptance

Acceptance records the assignee's acceptance of an Assignment.

The acceptance workflow changes the Assignment to:

ACCEPTED

Acceptance does not by itself change the EconomicRight beneficiary.

This creates a controlled separation between:

- Proposal
- Acceptance
- Completion

---

## 16. EconomicRight Transfer

The controlled transfer operation is:

ACCEPTED Assignment
? complete_assignment()
? Assignment COMPLETED
? EconomicRight beneficiary changes
? EconomicRight version increments

The operation verifies:

1. Assignment exists.
2. Assignment is ACCEPTED.
3. A matching accepted Acceptance exists.
4. EconomicRight exists.
5. Current beneficiary still equals the expected source.
6. The transfer has not already been completed.

A replay attempt is rejected.

NFT ownership remains unchanged.

This is an important architectural guarantee.

---

## 17. Current F18.04 Result

F18.04 proves the following live behavior:

- Assignment F18-04-ASSIGNMENT-001 became COMPLETED.
- Acceptance F18-04-ACCEPTANCE-001 remains ACCEPTED.
- EconomicRight F18-03-RIGHT-001 changed beneficiary.
- EconomicRight version increased from 1 to 2.
- Entitlement remained 500,000,000 IRR.
- NFT supply remained 1.
- NFT token 1,000,001 remained owned by 2vxsx-fae.
- A replayed completion attempt was rejected.
- The state persisted across canister upgrade.

Therefore:

**F18.04 = PASS / CLOSED**

---

## 18. Benefit, Obligation and Settlement

The financial architecture deliberately separates:

EconomicRight
!= Benefit
!= Obligation
!= Settlement
!= Accounting

EconomicRight answers:

> Who has the economic right?

Benefit answers:

> What economic benefit becomes due?

Obligation answers:

> Who has the duty to perform?

Settlement answers:

> Was the obligation fulfilled?

Accounting answers:

> What financial consequence was recorded?

This separation is the foundation of F19.

---

## 19. Guarantee

Guarantee is an independent commitment to support defined obligations.

Guarantee is different from collateral.

Collateral supports an obligation through pledged economic value.

Guarantee provides a contractual or institutional commitment.

Liquidity backing is another separate concept.

Therefore:

Collateral
!= Guarantee
!= Liquidity Backing

---

## 20. Tokenization

Tokenization is optional.

The preferred sequence is:

Asset
? Evidence
? Verification
? Eligibility
? Authorization
? Tokenization
? Ledger

A token represents a governed relationship.

A token does not automatically establish legal ownership.

---

## 21. External Institutional Systems

GERAM is designed to connect to external systems through adapters.

Examples include:

- Banks
- Capital markets
- CSD systems
- Custodians
- Payment systems
- ISO 20022 systems
- International financial networks

The integration pattern is:

GERAM
? Adapter
? External System
? Verified Response
? GERAM Reference/Event

The external institution remains authoritative for the state it legally owns.

---

## 22. Security

Security is cross-cutting.

Important controls include:

- Authorization
- Role separation
- Input validation
- Idempotency
- Replay protection
- Versioning
- Signature verification
- Audit trail
- Emergency controls
- Key-management separation
- Monitoring
- Recovery

Every sensitive state transition should answer:

Who?
What?
When?
Under which authority?
Against which version?
Based on which evidence?
With what result?

---

## 23. AI Governance

AI can analyze and recommend.

AI must not silently become the financial authority.

The correct model is:

AI Analysis
? Recommendation
? Policy
? Risk
? Authorization
? Signature
? Execution

This preserves human, institutional and policy control.

---

## 24. Technical Architecture

The current implementation uses:

- Internet Computer
- Motoko
- Candid
- Stable canister state
- ICRC-compatible digital-asset infrastructure
- PocketIC for local testing
- ICP tooling

The main project structure is:

backend/
frontend/
backend/backend.did
backend/src/

The backend contains the current GERAM Core implementation.

---

## 25. Development Lifecycle

Each development stage follows:

Inspect
? Design
? Minimal Implementation
? Build
? Candid Verification
? Upgrade Test
? Functional Test
? Persistence Test
? Negative / Replay Test
? Baseline
? Next Stage

The project follows:

> **Maximum Simplicity ? Minimum Necessary Complexity**

Completed stages are not reopened without a real technical reason.

No legacy compatibility model is maintained unless explicitly required.

---

## 26. Current Development Stages

The current verified development sequence includes:

- F13 ? Contract & Legal Reference Foundation
- F14 ? Persistence Foundation
- F15 ? Collateral & Encumbrance Foundation
- F16 ? Valuation & Economic Value Foundation
- F17 ? Verification / Trust & Evidence Foundation
- F18.01 ? Economic Right Foundation
- F18.03 ? Assignment & Acceptance Foundation
- F18.04 ? Economic Right Transfer Control

Current:

**F19 ? Market, Reference Rate and Service-Boundary Foundation**

F19 establishes market/reference snapshots, immutable external reference rates,
the boundary between GERAM Core and specialized financial services, and holder
independence.

F19 starts from the frozen F18.04 baseline.

---

## 27. Golden Rules

1. One Canonical GERAM Record, Many Specialized Services.
2. Real-world truth requires evidence and authorized verification.
3. Registration is not automatically legal ownership.
4. NFT ownership is not EconomicRight.
5. EconomicRight is not legal ownership.
6. Assignment is not completion.
7. Acceptance is not completion.
8. Collateral is not Guarantee.
9. Guarantee is not Liquidity Backing.
10. Valuation is versioned and time-bound.
11. Historical state must remain auditable.
12. AI recommendation is not authorization.
13. External institutions remain authoritative for their legal records.
14. Critical state transitions must be auditable.
15. Every completed stage must have a reproducible baseline.
16. Market price is discovered by supply and demand; GERAM does not set it.
17. GERAM does not calculate, promise or distribute investment returns.
18. Maturity liquidity is not a guaranteed secondary-market price.
19. GERAM does not control how a holder uses GERAM after authorized delivery.
20. Holder utilization is subject to the GERAM state, applicable law and contractual restrictions.
21. NFID.ONE provides the wallet and identity/control layer; GERAM remains the canonical economic record.
22. HamiFund, FlowChain, Marketplaces and other services are optional specialized services.
23. Use of an external service does not transfer that service's financial obligations to GERAM.
24. Pledge, lending, staking, investment and marketplace activity are separate service-layer activities.
25. GERAM must not become a financial intermediary merely because GERAM is accepted by a financial service.

---

## 28. Holder Independence & Service Neutrality

After authorized delivery of GERAM to the holder's NFID.ONE wallet, GERAM remains
neutral regarding the holder's subsequent utilization, subject to applicable law,
contractual terms and the current GERAM state.

The holder may, where permitted:

- Hold GERAM
- Transfer GERAM to another wallet
- List GERAM on an eligible marketplace
- Sell GERAM
- Pledge GERAM
- Use GERAM as eligible collateral
- Obtain financing against GERAM
- Stake GERAM where supported
- Invest through an eligible financial product
- Use other authorized services

GERAM does not require the holder to use HamiFund, FlowChain, a Marketplace or any
other specialized service.

The relevant service assumes responsibility for its own financial, operational
and regulatory obligations. GERAM remains responsible for its own canonical record,
lifecycle, contractual references, restrictions and defined maturity mechanisms.

Importantly:

> **Maturity Liquidity != Guaranteed Market Price**

Market price is discovered through supply, demand and market conditions. Any maturity
liquidity or protection mechanism must arise from the applicable contract, eligible
backing, guarantee structure and legal framework.

---

## 29. Executive Model

In simple terms:

GERAM asks:

> What is the economic asset or value, what proves it, what is it worth, what rights exist, what restrictions apply, and what happened to it?

NFID asks:

> Who is the participant, what account and wallet are involved, and what are they authorized to do?

The Holder decides:

> After authorized delivery to NFID.ONE, how do I lawfully use my GERAM?

Subject to applicable law, contractual terms and the current GERAM state, the holder
may hold, transfer, sell, list, pledge, obtain financing, stake, invest, or use other
eligible services.

HamiFund asks:

> How can eligible GERAM and capital be used in controlled financial activity?

FlowChain asks:

> How are exchange and settlement routed?

Marketplace asks:

> At what price can GERAM be bought or sold through supply and demand?

ICPCooperative asks:

> What independent guarantee or protection commitment exists?

zkEVM asks:

> Which programmable rules and proofs can be executed?

ISO 20022 asks:

> How can financial messages be standardized between institutions?

GERAM does not decide which of these services a holder must use.

Together they form a connected but domain-separated financial and real-asset ecosystem.


**T14-03 ? Atomic Authorized Direct GERAM Issuance & Direct NFT Delivery**

T14-03 is **PASS / CLOSED / FROZEN**.

T14-03 establishes the canonical GERAM issuance boundary:

**Validate ? Reserve GERAM ID Candidate ? Validate Legal Basis ? Mint RWA-NFT
Directly to Initial Holder ? Create GERAM ? Create Certificate ? Commit
Allocators ? Return Success**

Finalized principles:

- every GERAM requires a valid legal / contractual / authorized legal basis;
- missing or empty `external_reference` is rejected before Mint;
- GERAM ID candidates are obtained from `currentGeramId()`;
- duplicate GERAM candidates are rejected before Mint;
- RWA-NFT is minted directly to `request.initial_holder`;
- ICRC-7 remains the source of truth for NFT ownership;
- GERAM remains the canonical economic record;
- Certificate does not replace GERAM;
- no business validation capable of returning an issuance error remains after
  successful irreversible Mint and before registry completion;
- `nextGeramId` and `nextGeramTokenId` are committed only after successful
  Mint and registry creation;
- new GERAM records begin in `ACTIVE`;
- T14-03 does not introduce financial-service behavior into GERAM Core.

Verified positive issuance:

- Certificate: `T14-03-POSITIVE-NEW-001`
- Token: `1_000_009`
- Transaction: `8`
- Project: `F18-03-PROJECT-001`
- Initial holder: `2vxsx-fae`
- Legal basis: `LEGAL-BASIS-T14-03-POSITIVE-NEW-001`
- NFT supply after issuance: `9`

Implementation commit:

`205f449 feat(p2): finalize atomic GERAM issuance and direct delivery`

T14-03 is complete and frozen.

