# ZAR Integration and Adoption Framework

## Purpose

Make technical integration straightforward while keeping partner status and public claims evidence-based.

## Integration paths to develop

1. Wallet integration using the selected, tested ledger interface.
2. Merchant checkout or payment-request workflow.
3. Backend payment verification and reconciliation.
4. Treasury reporting and transaction exports.
5. Exchange integration where the exchange independently approves listing and custody requirements.
6. Payment-provider or banking integration only under a documented agreement and applicable permissions.

## Suggested onboarding sequence

1. Review the current token status, rights, fees, risks and supported networks.
2. Choose the integration type and review the API/SDK documentation.
3. Use a test environment and test assets.
4. Verify transaction state from the authoritative ledger, not solely from a client callback.
5. Test duplicate requests, timeouts, refunds, wrong-network transfers, insufficient balances and reconciliation.
6. Complete legal, compliance, custody and operational reviews.
7. Launch only after provider approval and monitoring readiness.

## Partner status vocabulary

Use only these status labels:
- Identified prospect
- Discussion in progress
- Technical evaluation
- Test integration
- Agreement signed
- Live integration
- Independently verified production use

Each status should have an owner, date, scope, evidence link and permission for public disclosure. Do not claim that all major banks, centralized exchanges, decentralized exchanges or currency exchanges accept ZAR unless each specific acceptance has been independently verified.

## Metrics

Track, where lawful and privacy-preserving:
- time from documentation start to first successful test transfer;
- integration completion time;
- transaction success and failure rates;
- reconciliation exceptions;
- fees and confirmation latency;
- active integrations and their verification date;
- uptime and incident response;
- user support and refund outcomes.

Publish methodology and reporting period. Do not invent adoption figures or imply that a growing roadmap is proof of current adoption.

## External partner checklist

- Product and legal status reviewed
- Token rights and redemption terms understood
- Network and ledger interface confirmed
- Security assessment completed
- Compliance and onboarding requirements mapped
- Fees and liquidity pathways disclosed
- Incident and support responsibilities agreed
- Production tests passed
- Public announcement approved by partner
- Evidence link stored in the repository
