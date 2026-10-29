# ZAR Whitepaper
## A practical, transparent digital settlement layer for the international economy

**Version:** 0.1 — design draft  
**Project:** ZAR, a subproject of GERAM-ICP  
**Target infrastructure:** Internet Computer (ICP)

> **Status and risk notice.** This is a project design paper, not an offer to sell a financial instrument and not evidence of a live token, reserve, legal peg, redemption promise, bank partnership, exchange listing, or market adoption. The 1:1 relationship with the South African rand is an intended design objective that must be established through legal terms, verified backing or another clearly disclosed mechanism, and independent evidence before it can be represented as operational. The ticker ZAR is already the ISO code for the South African rand; branding and legal review are required to avoid confusion.

## 1. Executive vision

Global commerce increasingly depends on online platforms, software services, digital businesses and suppliers operating across borders. These participants need payment infrastructure that is easy to integrate, transparent to audit, predictable in its rules, and compatible with digital wallets and automated business workflows.

ZAR aims to develop a digital settlement instrument and integration framework on ICP that can help businesses and digital-economy participants move value through programmable, traceable workflows. The project is designed around a simple proposition: make the technical path from integration to a verified transfer as clear as possible, while keeping monetary claims, custody, compliance and financial risk explicit.

The objective is not to claim that blockchain alone solves international payments. Adoption depends on counterparties, conversion and redemption pathways, compliance, liquidity, user experience, operational resilience and legal certainty. ZAR's design therefore treats technology, governance and partner connectivity as one system.

## 2. The problem to solve

International payment and settlement workflows can involve multiple providers, differing interfaces, reconciliation delays, opaque fees, fragmented records and integration costs. Online businesses may need to reconcile orders, invoices, wallet transfers, refunds and treasury movements across different systems.

A well-designed digital token can offer a common ledger interface and programmable transaction records. But a useful payment instrument must also answer difficult practical questions:
- What exactly does one unit represent?
- Can the holder redeem it, from whom, and under what conditions?
- How are reserves or backing independently checked, if there are any?
- Which providers accept it today?
- What are the network and provider fees?
- How are errors, refunds, disputes and sanctions screening handled?
- Who controls upgrades, minting and emergency procedures?
- What happens if a key, provider or integration is compromised?

ZAR's approach is to document these questions rather than hide them behind marketing.

## 3. Project mission

Develop a simple-to-integrate, security-focused digital settlement project for businesses and digital-economy applications, using ICP where it provides a suitable technical fit.

The project seeks to:
1. provide a clearly specified token ledger interface;
2. make supply, authorization and transaction behavior auditable;
3. support wallet and business-system integrations through documented APIs and standards;
4. define a transparent relationship—if legally and operationally achievable—with the South African rand;
5. reduce avoidable integration friction through examples, SDKs and concise onboarding;
6. make partner acceptance and deployment status verifiable;
7. support responsible growth without claiming adoption that has not been evidenced.

## 4. What ZAR is—and is not

ZAR is a proposed digital token project. It is intended to support settlement and business integrations, subject to the final technical and legal design.

It is not automatically:
- South African legal tender;
- a bank deposit or a claim against a bank;
- a rand-backed or redeemable instrument;
- insured money;
- accepted by a bank, exchange, merchant or payment provider;
- liquid at a particular price;
- a guaranteed investment or a source of yield.

Those properties require separate legal, financial and operational arrangements. A token ticker and a target exchange ratio do not create those rights.

## 5. The 1:1 rand objective

The project has expressed an objective of a one-to-one relationship with the South African rand. This must be converted into a precise, enforceable model before the project can responsibly claim a peg.

The design must select and publish one model, for example:
- **Redeemable reserve-backed model:** each eligible token represents a defined claim with published redemption terms and independently attested reserves.
- **Contractual settlement model:** a named issuer or provider undertakes a clearly defined redemption or settlement obligation under enforceable terms.
- **Non-pegged token model:** the token is not marketed as equivalent to fiat and its market value is determined by market conditions.

These models are not interchangeable. The first two require a verified issuer, custody arrangements, reconciliation, eligible-holder rules, liquidity planning, redemption service levels, legal analysis and ongoing independent evidence. If the project cannot substantiate these elements, it must use the non-pegged description and must not imply a guaranteed exchange rate.

## 6. Why ICP

The Internet Computer provides canister-based application execution, persistent application state and inter-canister communication. Standardized ledger interfaces such as ICRC can help wallets and applications interact through consistent methods.

The proposed implementation will evaluate:
- an ICRC-compatible ledger;
- transparent transaction and supply queries;
- canister-controller and upgrade governance;
- reliable monitoring and cycle management;
- a documented interface for wallets and merchant integrations;
- reproducible builds and published Wasm hashes;
- tests for authorization, arithmetic, upgrades and supply invariants.

ICP is a technical foundation, not a guarantee of legal acceptance, liquidity, fiat redemption or universal interoperability. External wallets, exchanges and banks must independently integrate and approve the asset.

## 7. Supply and issuance integrity

The current working parameters are a target initial supply of 133,000,000,000,000 ZAR and three decimal places, equivalent to 133,000,000,000,000,000 base units.

The intended supply ceiling is the same as the initial supply. This is only a requirement until the chosen implementation enforces it. A standard ledger's minting account does not automatically guarantee a hard cap.

The implementation must test that:
- unauthorized minting fails;
- no mint path can exceed the cap;
- arithmetic cannot overflow;
- transfers and fees preserve the supply invariant;
- burns update supply as specified;
- if burned units must never be reissued, cumulative lifetime issuance is also capped;
- upgrades preserve supply and authorization state.

The initial allocation and recipient must be formally approved before issuance. No allocation or holder distribution is asserted by this paper.

## 8. Intended use cases

Subject to readiness, legal review, partner support and local requirements, ZAR may explore:
- business-to-business settlement;
- invoices and supplier payments;
- online services and digital commerce;
- platform and creator-economy payments;
- treasury reconciliation and audit trails;
- wallet-based settlement;
- ICP-native applications requiring a fungible token;
- payment-provider or exchange connectivity where approved.

Each use case requires a tested flow for payment confirmation, refunds, duplicate requests, transaction finality, accounting, fraud controls and customer support.

## 9. User and business experience

A successful payment instrument should not require every business to become a blockchain specialist. The intended onboarding flow is:

1. **Understand:** read a short integration guide and review the token's actual status, fees, rights and risks.
2. **Choose an integration:** use a supported wallet, SDK or API example.
3. **Test:** run in a local or designated test environment with test assets.
4. **Verify:** confirm transaction identifiers, ledger state and reconciliation output.
5. **Go live:** only after compliance, custody, operational and provider requirements are met.
6. **Monitor:** track balances, confirmations, provider health, exceptions and audit evidence.

The project will aim for concise documentation, copyable examples, stable interfaces, clear error messages and predictable versioning. A fast technical integration does not remove KYC/AML, licensing, tax or contractual requirements that may apply.

## 10. Interoperability and external acceptance

The architecture is designed to make integration possible, not to assume that integration already exists.

Potential counterparties include wallet providers, payment processors, merchants, exchanges and financial institutions. Each relationship must be tracked as one of:
- identified prospect;
- discussion in progress;
- technical evaluation;
- test integration;
- signed agreement;
- live integration;
- independently verified production use.

Only the final statuses, supported by appropriate evidence, should be described as operational acceptance. Bank and exchange names, logos, listings or endorsement language must not be used without permission and verifiable confirmation.

## 11. Security and governance

The project will follow least privilege, separation of duties, controlled upgrades, secure key management and public release evidence. Treasury custody should be distinct from unrestricted mint authority wherever practical. Critical actions should require policy-defined authorization and auditable approval.

Security work includes:
- threat modeling and adversarial tests;
- controller and upgrade review;
- dependency and toolchain pinning;
- reproducible or independently checked builds;
- monitoring and incident response;
- secret scanning;
- independent review before mainnet release.

No independent audit is claimed until an actual audit report is published.

## 12. Compliance and legal design

A token intended for cross-border settlement can raise questions under payment-services, e-money, securities, money-transmission, sanctions, consumer-protection, tax, data-protection and financial-promotion rules. The applicable analysis depends on the issuer, rights, backing, jurisdictions, customers and actual operating model.

Before launch, the project must obtain qualified legal advice for relevant jurisdictions and document the resulting product boundaries. A technical protocol does not itself confer a licence or authorize a financial activity.

## 13. Roadmap

### Phase A — Define
Confirm legal model, intended rand relationship, token rights, issuance policy, supply cap semantics, roles and initial allocation.

### Phase B — Build
Implement the selected ledger and supply controls; pin the toolchain; add interfaces, examples and automated tests.

### Phase C — Verify
Run unit, integration and adversarial tests; review controller permissions, upgrade behavior, security assumptions and accounting.

### Phase D — Test integrations
Publish sandbox examples; test wallet and merchant flows; measure transaction reliability, integration time and operational costs.

### Phase E — Partner readiness
Complete legal, compliance and commercial reviews with each provider. Publish only confirmed partner statuses.

### Phase F — Release
Proceed to mainnet only after explicit approval, independent verification, monitoring, recovery procedures and public release evidence.

### Phase G — Measure and improve
Report verified integrations, real usage metrics, incidents, uptime, fees and roadmap progress with methodology and dates.

## 14. Measures of progress

The project should measure progress using evidence, not promotional adjectives:
- successful tests and release reproducibility;
- verified ledger invariants;
- integration completion time;
- successful transaction and reconciliation rates;
- network and provider costs;
- independently confirmed live integrations;
- active businesses and transaction volume where privacy-preserving reporting is lawful;
- incident response and remediation times;
- reserve/redemption attestations if a fiat relationship is implemented.

Metrics must include definitions, date ranges and limitations. No adoption growth rate is claimed at this stage.

## 15. Risks and mitigations

- **Peg or redemption failure:** do not claim a peg until legal rights, reserves and redemption operations are evidenced; publish deviations and contingency procedures.
- **Low liquidity or limited acceptance:** communicate actual availability and conversion routes; never imply universal acceptance.
- **Smart-contract defect:** use tests, review, staged deployment and controlled upgrades.
- **Key compromise:** separate roles, limit authority, monitor changes and rehearse response.
- **Regulatory uncertainty:** obtain jurisdiction-specific advice before enabling regulated functions.
- **Ticker confusion:** clearly distinguish the project token from the South African rand and obtain branding/legal review.
- **Integration failures:** version interfaces, test edge cases and publish operational status.
- **Misleading claims:** require evidence and owner approval for public claims about backing, partners, adoption and performance.

## 16. Invitation to integration partners

ZAR invites qualified developers, merchants, wallet teams, payment providers, exchanges and financial institutions to review the technical proposal and assess potential integrations. The initial engagement should focus on a documented use case, test environment, compliance boundaries, settlement model and measurable acceptance criteria.

An expression of interest is not a commitment or evidence of acceptance. Partner participation should be announced only with permission and factual supporting documentation.

## 17. Closing

ZAR's ambition is to make digital settlement easier to understand, integrate and audit for international commerce and the digital economy. Its credibility must come from precise rights, sound engineering, transparent governance, verified integrations and honest reporting.

**Simple to integrate. Transparent by design. Governed for trust. Built for interoperability.**

These are design goals. Production performance, broad acceptance and monetary equivalence must be demonstrated, not presumed.
