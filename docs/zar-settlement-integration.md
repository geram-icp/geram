# GERAM — Digital Rand (ZAR) settlement integration contract
**Status:** Proposed architectural integration; no live transfer, Mainnet deployment, or regulatory approval is implied.  
**Reference:** ZAR issuer policy baseline recorded 2026-11-15 in the separately governed `geram-icp/ZAR` repository.

## Scope and authority boundaries
GERAM remains authoritative for asset identity (GERAM-ID), evidence, verification status, certificates, rights and valuation references. The canonical ICP ZAR ledger remains authoritative for token balances, transfers and supply. ZARID/NFID present verified wallets and authenticated user workflows; HamiFund remains authoritative for financial positions and exposures. FlowChain coordinates settlement but does not become a replacement ledger.

A GERAM certificate, RWA record or NFT does not automatically represent legal title, collateral, issuance entitlement, or permission to initiate a payment.

## Agreed Digital Rand target
- Token: **Digital Rand (ZAR)** on ICP, 3 decimals and zero raw-unit token transfer fee.
- Intended issuer: Cooperative Investment Guarantee Services Company, subject to corporate/legal verification.
- Proposed redeemability: 1 ZAR against 1 South African rand under explicit issuer legal terms, with eligible reserves at least 110% of liabilities.
- Genesis target: 133,000,000,000,000 ZAR **only following full proof of adequate backing**, not an instruction to create it.
- Additional issuance requires independently validated reserve headroom and authorized-manager signature; burns require holder authorization.
- Holder redemption target is 3 business days to a verified account, in rand or agreed settlement currency.
- Daily public supply/reserve disclosure; quarterly independent audit.
- ZAR.TODAY exposes **independent reference, redemption and settlement prices** with provenance, timestamps and quote expiry.
- External wallet listing, regulator endorsements, BRICS PAY or domestic bank-card connectivity remain **unverified integration dependencies**, not active capabilities.

## GERAM payment/settlement reference contract
For a payment that references a GERAM asset or certificate, exchange versioned references instead of copying authoritative domain state:
- `geram_id`, `certificate_id`, `asset_version`, `verification_ref`, `rights_ref`.
- `payer_icrc_account`, `payee_icrc_account` (Principal + optional 32-byte subaccount, not a legacy Account Identifier).
- `amount_base_units` as unsigned integer; `decimals=3`; `ledger_canister_id` and `network`.
- `purpose`, `settlement_quote_id`, `quote_expiry`, `currency_pair`, `settlement_rate_source`.
- `authorization_evidence_ref`, `idempotency_key`, `correlation_id`, `ledger_block_or_tx_ref`.
- `status`, `confirmed_at`, `reconciliation_ref`, and reason codes for failure/reversal/disputes.

## Mandatory safeguards
1. Verify asset eligibility, current rights and authorization **before** creating a settlement instruction.
2. Require holder wallet signatures and authenticated NFID Principal linking; do not store seed phrases or private keys.
3. Treat ZAR.TODAY reference quotes as non-executable unless explicitly issued as a valid settlement quote.
4. Confirm and reconcile the exact on-chain payment, receiver, block/transaction and amount before GERAM records a settled lifecycle event.
5. Prevent replay, duplicate settlement and false finality through durable idempotency keys and state-machine checks.
6. Handle partial settlements, timeouts, stale data, complaints and off-chain failures without inventing token movements.
7. Do not imply that token settlement transfers legal ownership of the underlying RWA absent independently verified governing instruments.
8. Record signed evidence hashes and provenance without publishing identity secrets, personal financial details or restricted legal documents.

## Acceptance gates
- Published API schema and settlement state transitions with contract tests.
- Correct 3-decimal integer arithmetic and 0-fee compatibility in a pinned official ICRC ledger.
- End-to-end local tests for authorized payment, duplicate, expired quote, wrong destination, chain reorg/finality assumptions, and reconciliation failures.
- Independent legal and compliance approval for each asset category/jurisdiction and actual cash-out rail.
- Real operator consent for NFID.ONE, banking or third-party integrations before claiming availability.

**No Mainnet action is authorized by this document.**
