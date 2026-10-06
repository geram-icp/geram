# GERAM F19-T10 Final Baseline

## Status

PASS / CLOSED

## Scope

Service Boundary & Integration Contract

## Architectural Principle

GERAM Core remains the canonical economic record.
Specialized services own their own operational, financial, market,
identity, settlement, guarantee and accounting responsibilities.

## Integration Pattern

External System
-> Adapter
-> GERAM Typed Reference
-> GERAM Core

GERAM does not copy external financial ledgers into Core.

## GERAM -> NFID

GERAM provides relevant certificate, token, economic-right,
lifecycle, maturity, transferability, restriction and collateral
references.

NFID owns identity, account, wallet, control, authorization and
wallet-level transfer operations.

## GERAM -> HamiFund

GERAM provides references to Asset, GeramCertificate,
EconomicRight, Collateral, ValuationRecord, MarketSnapshot,
ReferenceRate and lifecycle state.

HamiFund owns holding, staking, credit, lending, financing,
rewards, financial risk, accounting and financial positions.

## GERAM -> Marketplace

GERAM provides GERAM reference, transferability, current state,
restrictions, maturity and relevant market/proof references.

Marketplace owns listing, trading, liquidity and price discovery.

Market price is determined by supply, demand and market conditions.

## GERAM -> FlowChain

GERAM provides relevant transfer eligibility, GERAM references,
collateral constraints and contractual/right references.

FlowChain owns exchange, clearing, settlement and liquidity routing.

## External Institutions

Official external records remain authoritative within their own
legal and operational domains.

GERAM stores references and evidence; it does not replace official
registries or regulated institutions.

## Prohibited Core Responsibilities

GERAM Core must not become:

- Profit engine
- Yield engine
- Reward engine
- Staking engine
- Credit engine
- Lending engine
- Loan engine
- Financing engine
- Interest engine
- LTV engine
- Market-price engine
- Marketplace engine
- Settlement engine
- Accounting engine

These functions belong to specialized services where legally and
operationally applicable.

## Existing Core References

The current Core already provides typed references for:

Project
Asset
Contract
Evidence
Verification
Valuation
GeramCertificate
EconomicRight
Assignment
Acceptance
Collateral
MarketSnapshot
ReferenceRate

The current HamiFund registry provides:

HamiFund
FundAsset
FundPosition
FundTransaction

## Integration Model Decision

No new generic ExternalIntegrationReference model is required
at this stage.

Existing typed references and external_reference fields are
sufficient for the current integration boundary.

Future adapters may be added without enlarging the canonical
economic model unnecessarily.

## Golden Rules

1. GERAM is the canonical record for its own domain.
2. External systems remain authoritative for their own domains.
3. Reference is not duplication.
4. Transferability is not market liquidity.
5. Market liquidity is not guarantee.
6. Maturity liquidity is not a guaranteed secondary-market price.
7. NFT ownership is not economic-right ownership.
8. Economic rights are not financial positions.
9. Financial services remain outside GERAM Core.
10. AI recommendation is not authorization.
11. Holder service choice remains independent after authorized
    delivery, subject to law, contract and GERAM state.
12. Integration must use adapters and explicit references.
13. Core complexity must remain minimal.
14. No new model should be introduced when an existing typed
    reference already satisfies the requirement.

## Baseline

This baseline follows:

3818c58 docs: freeze GERAM holder independence and service neutrality

No code changes are required by F19-T10.

