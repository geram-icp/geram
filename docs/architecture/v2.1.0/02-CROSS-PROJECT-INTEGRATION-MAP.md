# Cross-Project Integration Map

## Projects

The ecosystem contains four independent projects:

1. GERAM
2. HamiFund
3. NFID
4. FlowChain

## Integration Principle

Projects remain independent.

Integration is performed through explicit and versioned interfaces.

Preferred mechanisms include:

- Candid
- APIs
- Events
- Integration contracts
- Signed messages
- Read models
- Verified references
- Approved adapters

## GERAM <-> HamiFund

GERAM provides verified asset and economic-value references.

HamiFund uses eligible GERAM information for financial products,
capital orchestration, financing and financial exposure.

HamiFund does not become the source of truth for GERAM assets.

## GERAM <-> NFID

NFID provides identity, account and wallet access functions.

GERAM provides asset and RWA information.

NFID does not become the source of truth for GERAM assets.

## GERAM <-> FlowChain

FlowChain provides blockchain infrastructure and authorized FLOW
integration.

GERAM records remain the source of truth for GERAM assets.

FLOW ledger records remain authoritative in the applicable FLOW ledger.

## HamiFund <-> NFID

NFID provides authorized identity, account and wallet context.

HamiFund provides financial positions, products and financial data.

Neither project replaces the source of truth of the other.

## HamiFund <-> FlowChain

HamiFund may use authorized FlowChain services for blockchain-based
financial operations.

Financial positions remain under HamiFund authority.

FLOW balances remain under the applicable FLOW ledger.

## NFID <-> FlowChain

NFID may provide unified wallet and account views.

The authoritative blockchain balance remains on the applicable ledger.

## Integration Requirements

Every cross-project integration should define:

- Contract ID
- Contract version
- Source
- Destination
- Authority
- Source of truth
- Request
- Response
- Event
- Error model
- Idempotency
- Retry policy
- Security policy
- Audit record
- Upgrade policy
