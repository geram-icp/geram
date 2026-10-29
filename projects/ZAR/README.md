# ZAR — A Global-Ready Digital Settlement Project on ICP

**ZAR is a proposed digital-asset and settlement project within the GERAM-ICP ecosystem.** It is designed to explore faster, more transparent and easier-to-integrate digital value transfers for international commerce, online businesses and participants in the digital economy.

> **Important status notice:** ZAR's intended relationship to the South African rand (ZAR) is a design objective, not proof of a legally enforceable 1:1 peg, bank acceptance, exchange listing, redemption guarantee, reserve backing or current market price. Those claims require documented legal arrangements, verifiable backing and independent evidence. No broad bank or exchange acceptance or rapid adoption is claimed in this repository unless and until verified.

## Why this project

International businesses and digital platforms often need payment workflows that are predictable, traceable, accessible through APIs, and compatible with modern digital infrastructure. ZAR's design goal is to provide a simple token interface on the Internet Computer (ICP), supported by clear supply rules, transparent transaction records, security-focused governance and a practical integration path.

Potential use cases—subject to technical readiness, partner acceptance and applicable law—include:
- settlement between businesses and service providers;
- online commerce and digital-platform payments;
- treasury and reconciliation workflows;
- cross-border business-to-business transfers;
- integration with wallets and compliant payment providers;
- digital-economy applications built on ICP.

These are intended use cases, not a claim that each use case is currently available or legally permitted in every jurisdiction.

## Relationship to the South African rand

The ticker `ZAR` is also the ISO currency code for the South African rand. The project must avoid implying that a token is equivalent to fiat money merely because it uses the same ticker.

The project's intended 1:1 rand objective must be defined and evidenced before it is marketed as a pegged or redeemable instrument. Required evidence includes:
1. the legal issuer and holder rights;
2. the precise redemption obligation and eligible jurisdictions;
3. reserve/collateral model, custody, reconciliation and independent attestations, if applicable;
4. banking and payment-provider arrangements;
5. licensing and regulatory analysis;
6. independent monitoring and a public process for reporting deviations.

Until those conditions are satisfied and published, ZAR must be described as a proposed digital token project—not as South African legal tender, a bank deposit, or a guaranteed rand substitute.

## Initial technical requirements

- Symbol: `ZAR` (working symbol; collision and branding review required)
- Working name: `ZAR Token`
- Decimals: `3`
- Intended initial supply: `133,000,000,000,000 ZAR`
- Corresponding base units at 3 decimals: `133000000000000000`
- Intended supply ceiling: initial supply, pending implementation and adversarial tests
- Target network: Internet Computer (ICP)
- Ledger interface: ICRC-1 under evaluation; ICRC-2 only if allowance-based transfers are justified

## Architecture and trust principles

- GERAM-ICP is the parent project; ZAR is a subproject.
- The ledger, treasury, governance, reserve evidence, and integration services have distinct responsibilities.
- No hard supply cap is claimed unless enforced on every mint path and tested.
- A 1:1 fiat relationship is not claimed without enforceable redemption terms and verifiable backing.
- Exchange or bank integration is described as completed only after the partner confirms it publicly or through verifiable documentation.
- Deployment IDs, source commits, Wasm hashes and test results are published only after verification.
- No seed phrases, private keys, passwords or access tokens belong in Git.

## Start here

- [Whitepaper](WHITEPAPER.md)
- [Technical architecture](docs/architecture.md)
- [Tokenomics and supply invariants](docs/tokenomics.md)
- [Security model](docs/security.md)
- [Integration and adoption framework](docs/integrations.md)
- [Implementation roadmap](docs/roadmap.md)
- [Deployment and release checklist](docs/deployment.md)
- [Technical decision log](decisions/README.md)

## Current status

**Design and implementation preparation.** This repository does not itself prove that a production ledger has been deployed, that a peg or redemption facility exists, that banks or exchanges accept the token, or that the token has market liquidity. The roadmap defines the evidence required before such statements can be made.
