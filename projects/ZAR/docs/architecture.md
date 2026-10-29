# ZAR Technical Architecture

## 1. Scope

ZAR is a token project under GERAM-ICP. The architecture must distinguish the token ledger from the GERAM real-world-asset registry, treasury custody, governance, interfaces, and market integrations.

## 2. Proposed components

1. **ICRC ledger** — balances, transfers, fees, transaction history, and the standard ledger interface.
2. **Supply-policy controller** — if required, enforces the maximum-supply invariant and tightly restricts any mint path. Its authority and failure modes must be reviewed.
3. **Treasury** — receives and holds allocations under a documented custody policy; it must not automatically have unrestricted minting power.
4. **Governance and access control** — separates proposal, approval, execution, emergency pause (if supported), and routine operations.
5. **Monitoring and evidence** — records canister IDs, Wasm hashes, release versions, configuration, test results, and upgrade history without secrets.
6. **Client and integrations** — wallets, explorers, DEXs, and GERAM interfaces must use documented ledger interfaces and must not be treated as authoritative for ledger state.

## 3. Critical design constraint

An ordinary ICRC-1 ledger configuration with a minting account does not by itself guarantee a hard maximum supply. A controller or custom ledger implementation must make the cap invariant enforceable on every mint path. If the chosen ledger cannot enforce this invariant in the required trust model, do not advertise a hard cap without a separately justified architecture.

The preferred invariant is:

- total supply never exceeds the approved cap;
- minting is rejected if it would exceed the cap;
- burning decreases total supply;
- burned units cannot be restored except through a new, explicitly governed mint that still obeys the cap policy;
- all mint and burn events are auditable.

The project must decide whether burning permanently reduces the remaining lifetime issuance budget. For a truly non-reissuable burned supply, track cumulative minted units as well as current total supply and require cumulative minted units never to exceed the cap.

## 4. Identity and roles

Use distinct identities for:
- ledger controllers;
- mint-policy authority;
- treasury custody;
- operational deployment;
- monitoring/read-only inspection.

Do not put seed phrases or private keys in repository files, issues, logs, or reports. Use hardware-backed or threshold custody where appropriate and document recovery procedures without disclosing secret material.

## 5. Configuration requirements

Before deployment, review:
- token name and symbol;
- decimals and exact base-unit arithmetic;
- initial mint amount and recipient;
- transfer fee and any collector;
- minting and burning rules;
- controllers and upgrade authority;
- archive configuration;
- ICRC-2 allowance behavior if enabled;
- privacy and transaction-log expectations;
- cycle funding and monitoring;
- recovery and incident procedures.

## 6. Mainnet gate

No mainnet deployment is approved by this document. Deployment requires reviewed source, reproducible build, test evidence, final canister configuration, confirmed recipient, controller review, and explicit release authorization.
