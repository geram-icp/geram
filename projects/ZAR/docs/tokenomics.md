# ZAR Tokenomics and Supply Controls

## Approved working parameters

| Parameter | Working value |
|---|---|
| Symbol | ZAR |
| Name | ZAR Token |
| Decimals | 3 |
| Initial supply target | 133,000,000,000,000 ZAR |
| Base units | 133,000,000,000,000,000 |
| Intended cap | 133,000,000,000,000 ZAR |
| Network | Internet Computer |

At 3 decimals, one ZAR equals 1,000 base units. Therefore 133 trillion ZAR corresponds to 133 quadrillion base units (133,000,000,000,000,000).

## Required supply invariants

Let:
- `CAP` be the approved cap in base units;
- `total_supply` be current outstanding supply;
- `cumulative_minted` be all units ever minted, including units subsequently burned.

Required checks:
1. `total_supply <= CAP`
2. `cumulative_minted <= CAP` if burned units may never be reissued.
3. Minting amount must be positive and checked for integer overflow before state changes.
4. A mint that would violate either invariant must fail atomically.
5. A burn must be authorized, balance-checked, and reflected in total supply.
6. Transfer fees and archived transactions must not create or destroy supply unintentionally.
7. Upgrade and migration procedures must preserve all invariants and state.

If the intended rule is instead that burned capacity can be reissued, the policy must be explicitly changed and approved; it must not be silently assumed.

## Allocation schedule

No final allocation percentages or recipients are approved in this baseline. Before initial issuance, publish a reviewed allocation schedule that identifies each allocation, recipient or custody arrangement, vesting/lockup terms if any, and the authority that can move it. Avoid publishing personal information or wallet secrets.

## Valuation and claims

Token supply does not establish a market price, redemption right, collateral value, legal ownership, guaranteed return, or backing by real-world assets. Any such claim requires separate evidence, legal review, and explicit documentation.

## Acceptance tests

- Initial supply equals the approved amount.
- Initial supply is assigned only to the approved recipient(s).
- Unauthorized minting fails.
- Minting that would exceed the cap fails.
- Burning lowers total supply.
- If non-reissuable burn is the policy, minting after a burn cannot exceed the remaining cumulative issuance budget.
- Transfers preserve total supply except for explicitly specified fees.
- Upgrade and recovery tests preserve supply accounting.
