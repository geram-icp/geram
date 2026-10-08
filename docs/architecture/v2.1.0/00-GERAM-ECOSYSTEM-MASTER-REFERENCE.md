# GERAM Ecosystem Master Reference

## Version

- Version: 2.1.0
- Status: Integrated Architecture Baseline
- Scope: GERAM Ecosystem
- Primary platform: Internet Computer (ICP)

## 1. Purpose

GERAM is a digital economic infrastructure for identifying,
standardizing, documenting, verifying, valuing, financing, executing,
measuring, realizing and settling real economic assets, projects,
contracts and rights.

GERAM connects real economic activity with trusted digital records,
verification, financial infrastructure and settlement.

GERAM is designed for multiple economic sectors, including:

- Energy
- Housing
- Logistics
- Production
- Tourism
- Infrastructure
- Technology
- Other real economic assets

Energy is an important implementation domain, but GERAM is not limited
to energy.

## 2. Core Definition

GERAM means:

Global Economic Real Asset Mechanism

GERAM is a mechanism and digital infrastructure for representing
defined real-economic value and rights through controlled digital
records.

GERAM does not automatically create legal ownership, financial value,
liquidity, licensing rights or regulatory approval.

## 3. Fundamental Rule

Digital Representation != Underlying Asset

A digital record, RWA, NFT, certificate or token represents defined
rights, evidence or economic information.

It does not replace the underlying real-world asset, legal title,
official registry, license, contract, certificate or competent
authority.

## 4. What GERAM Is Not

GERAM is not:

- A bank
- A payment institution
- An exchange
- A broker
- A fund
- A custodian
- A guarantor
- A regulator
- A parallel financial market

GERAM may connect to authorized institutions and financial systems
through defined integration boundaries.

## 5. Four-Project Ecosystem

The GERAM Ecosystem consists of four separate projects:

1. GERAM
2. HamiFund
3. NFID
4. FlowChain

Each project has its own:

- Source code
- Repository
- Implementation lifecycle
- Responsibilities
- Security boundary
- Data boundary
- Source-of-truth boundary
- Upgrade process

The projects are integrated through controlled interfaces.

## 6. Development Sequence

The approved development sequence is:

GERAM -> HamiFund -> NFID -> FlowChain

This sequence defines implementation priority.

It does not reduce the architectural importance of any project.

NFID and FlowChain are prepared as future development workspaces.
Their architecture and integration boundaries are defined before their
implementation begins.

## 7. Project Responsibilities

### 7.1 GERAM

GERAM is responsible for:

- Real-economic asset registration
- GERAM-ID
- Asset identity
- Asset passport
- Rights
- Evidence
- Verification
- Attestation
- Valuation references
- Eligibility
- Authorization
- GERAM certificates
- RWA representation
- Asset lifecycle
- Measurement and realized-value records
- Asset traceability

GERAM is the source of truth for GERAM assets and their registered
economic representations.

### 7.2 HamiFund

HamiFund is the financial intelligence, capital orchestration and
global connectivity layer of the GERAM Ecosystem.

HamiFund is responsible for:

- Capital orchestration
- Financial products
- Fund and position management
- Credit
- Lending
- Collateral
- Guarantees
- Liquidity
- Yield
- Financial exposure
- Financial risk
- AI-DeFi
- Real-asset finance
- Institutional finance
- Global financial connectivity
- Financial settlement integration

HamiFund is the source of truth for its own financial positions,
financial products, exposures and financial records.

### 7.3 NFID

NFID is the identity, account, wallet and unified financial-view layer.

NFID is responsible for:

- Digital identity
- Account management
- Wallet management
- Identity security
- Account security
- Wallet linking
- Unified financial view
- Transaction access
- User security
- Navigation across authorized ecosystem services

NFID does not replace the source of truth of GERAM assets,
HamiFund financial positions or blockchain ledgers.

### 7.4 FlowChain

FlowChain is the blockchain and financial infrastructure layer for
the FLOW ecosystem.

FlowChain is responsible for:

- Blockchain infrastructure
- FLOW asset infrastructure
- Financial blockchain services
- Ledger connectivity
- Institutional blockchain integration
- Authorized financial rail connectivity
- Integration with GERAM
- Integration with HamiFund
- Integration with NFID

FlowChain does not replace GERAM as the source of truth for
real-world assets.

FlowChain does not replace HamiFund as the source of truth for
financial positions.

## 8. Source-of-Truth Architecture

The ecosystem must maintain explicit source-of-truth boundaries.

| Object | Source of Truth |
|---|---|
| GERAM Asset | GERAM |
| GERAM-ID | GERAM |
| Rights Record | GERAM |
| Evidence Record | GERAM |
| GERAM Certificate | GERAM |
| Financial Position | HamiFund |
| Financial Product | HamiFund |
| Credit Exposure | HamiFund |
| User Identity | NFID |
| User Account | NFID |
| Wallet Link | NFID |
| ICP Ledger Balance | ICP Ledger |
| FLOW Ledger Balance | FlowChain / FLOW Ledger |
| Bank Balance | Bank or Financial Institution |
| Payment State | Payment Domain |
| Settlement State | Settlement Domain |
| Accounting Record | Accounting Ledger |

No project may silently become the source of truth for an object owned
by another project.

## 9. Economic Chain

The canonical GERAM economic chain is:

REAL ECONOMY
-> ASSET / PROJECT / CONTRACT
-> GERAM-ID
-> RIGHTS
-> EVIDENCE
-> VERIFICATION
-> VALUATION
-> ELIGIBILITY
-> RISK
-> FINANCING
-> REPRESENTATION / TOKENIZATION
-> EXECUTION
-> MEASUREMENT
-> REALIZED VALUE
-> PAYMENT
-> SETTLEMENT
-> RECONCILIATION
-> ACCOUNTING
-> AUDIT / REPORTING

## 10. RWA Lifecycle

The standard RWA lifecycle is:

DRAFT
-> SUBMITTED
-> IDENTITY_VALIDATION
-> EVIDENCE_COLLECTION
-> VERIFICATION
-> ATTESTATION
-> VALUATION
-> AUTHORIZATION
-> ISSUANCE
-> CERTIFICATE_CREATED
-> NFT_MINTED
-> REGISTERED
-> ACTIVE
-> MONITORED
-> TRANSFERRED / ENCUMBERED / COLLATERALIZED
-> SETTLED / REDEEMED / EXPIRED / SUSPENDED

The actual legal effect of each state depends on the applicable
contract, law, authority and approved business process.

## 11. Expected, Measured and Verified Value

The system must keep these concepts separate:

Expected Benefit
!= Measured Benefit
!= Verified Benefit
!= Official Certificate
!= Realized Cash

A projection is not a measurement.

A measurement is not automatically a verification.

A verification is not automatically an official certificate.

A certificate is not automatically realized cash.

## 12. Architecture Layers

The ecosystem is organized into controlled layers:

1. Real Economy
2. Legal and Contract Layer
3. GERAM Core
4. Rights and Evidence
5. Verification and Valuation
6. RWA and Tokenization
7. NFID Identity and Account
8. HamiFund Finance
9. FlowChain and Blockchain Infrastructure
10. Payment and Settlement
11. Accounting and Reconciliation
12. Risk and Compliance
13. AI and Decision Support
14. Data and Knowledge
15. API and Integration
16. Frontend and Applications
17. Operations and Observability
18. Governance and Audit

## 13. On-Chain / Off-Chain / Official Records

Every important object must have an explicit system boundary.

### On-Chain

Used for controlled digital state, ownership records where applicable,
transaction state, cryptographic proofs and auditable execution.

### Off-Chain

Used for data that should not or cannot be stored directly on-chain,
including large documents, sensitive information, external data and
specialized services.

### Official System of Record

Used for legally or institutionally authoritative records such as
government registries, bank records, official certificates and other
recognized external systems.

No blockchain record automatically overrides an official record.

## 14. ICP Foundation

ICP is the primary decentralized technical foundation of the GERAM
architecture.

The implementation should use:

- Canisters
- Candid interfaces
- Inter-canister calls
- Stable storage
- Upgrade controls
- Certified data where appropriate
- Cryptographic verification
- Event and audit records

Generic blockchain concepts must not be used as a substitute for
actual ICP architecture where ICP is the defined platform.

## 15. Cross-Project Integration

Projects must not copy each other's source code.

Cross-project functionality must use controlled interfaces such as:

- Candid
- APIs
- Events
- Integration contracts
- Signed messages
- Read models
- Verified references
- Approved adapters

Every integration must define:

- Sender
- Receiver
- Authority
- Source of truth
- Object
- Contract version
- Request
- Response
- Event
- Error model
- Retry policy
- Idempotency
- Audit record
- Security policy

## 16. Financial Connectivity

Financial connectivity is an integration function.

The ecosystem may connect to:

- Banks
- Payment systems
- Capital markets
- Financial institutions
- Foreign exchange infrastructure
- Blockchain networks
- Digital asset infrastructure

Such connections do not make GERAM, NFID, HamiFund or FlowChain
the legal operator of an external financial service unless separately
authorized and legally established.

## 17. Domain 30

Domain 30 is:

Iran Financial Rails, Rial Settlement and FlowChain-ICP Connectivity.

Its role is a Financial Connectivity and Settlement Abstraction Layer.

It is not:

- A bank
- A PSP
- An exchange
- A new currency issuer
- A parallel payment network

Core distinctions:

IRR = Fiat financial rail

ICP = Native blockchain asset and ledger

FLOW = Native blockchain asset and ledger

GERAM = RWA and financial-asset representation

Domain 30 connects these systems through authorized financial and
technical rails.

It does not become the source of truth for their balances.

## 18. HamiFund Global Connectivity

HamiFund must treat global financial connectivity as a controlled
architecture layer.

Before activating a financial route, the system should evaluate:

- Counterparty
- Jurisdiction
- Sanctions
- Licensing
- AML/KYC requirements
- Provider eligibility
- Product eligibility
- Transaction limits
- Risk controls

Institutional integrations must be described as authorized or future
integration frameworks unless a formal and verifiable agreement exists.

## 19. AI Governance

AI may provide:

- Analysis
- Classification
- Risk signals
- Recommendations
- Forecasts
- Monitoring
- Anomaly detection
- Decision support

AI must not independently perform high-risk financial or legal actions
without the required human authority and authorization.

High-risk actions require appropriate:

- Human review
- Authorization
- Policy checks
- Audit records
- Explainability
- Access control

## 20. Security Constitution

The ecosystem follows:

- Zero Trust
- Least Privilege
- RBAC
- ABAC
- Separation of Duties
- MFA
- Key isolation
- Secure signing
- Audit logging
- Recovery controls
- Change control
- Emergency controls

Security controls must exist at project, service, API, wallet,
identity, financial and operational levels.

## 21. Legal and Regulatory Boundary

Technology does not replace law.

The architecture must preserve the distinction between:

- Technical capability
- Contractual rights
- Legal rights
- Regulatory permission
- Institutional authority
- Financial execution

A technical feature must not be presented as a legal or regulatory
approval.

## 22. Traceability

The final architecture uses the frozen T0-T66 traceability baseline.

The canonical traceability chain is:

T Requirement
-> Architecture Part
-> Chapter
-> Domain
-> Object
-> State Machine
-> Implementation Unit
-> Repository Location
-> Canister / Service
-> API / Event
-> Invariant
-> Test
-> Release

T0-T66 is a traceability matrix.

It is not a replacement for the architecture chapters.

## 23. Master Architecture Structure

The detailed architecture is organized into:

- 24 Parts
- 325 Chapters
- 30 Domains
- T0-T66 Traceability
- Master Registers
- Architecture Decision Records
- Golden Rules
- Test and Invariant Registry

The detailed chapter structure is maintained separately from this
master reference.

## 24. Change Control

Architecture changes must follow:

ADR
-> Impact Analysis
-> Version Change
-> Approval
-> Implementation
-> Test
-> Release

No implementation change may silently redefine a frozen architecture
rule.

## 25. Implementation Priority

Implementation priority is:

Phase 1:
GERAM Core

Phase 2:
HamiFund

Phase 3:
NFID

Phase 4:
FlowChain

Shared architecture, interfaces and contracts should be defined before
dependent implementation begins.

## 26. Final Architecture Principle

GERAM connects the real economy to trusted digital and financial
infrastructure.

The four projects remain separate systems with clear responsibilities.

GERAM owns GERAM assets and their registered representations.

HamiFund owns its financial positions and financial products.

NFID owns identity, account and wallet-linking functions.

FlowChain is responsible for its blockchain infrastructure and authorized FLOW integration functions. The authoritative FLOW ledger remains the applicable FLOW network or ledger.

External banks, payment systems, official registries and other
institutions remain authoritative for their own records.

The ecosystem is integrated by explicit interfaces, not by merging
sources of truth.

