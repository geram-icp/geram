# ZAR Implementation Roadmap

## Stage 0 — Repository baseline
- [x] Establish ZAR project documentation under GERAM-ICP.
- [x] Record initial token and supply requirements.
- [ ] Inventory current source, configuration, and existing canister IDs before changing anything.
- [ ] Confirm whether any existing ledger is local-only or deployed.

## Stage 1 — Design decisions
- [ ] Select one official ledger implementation and supported standards.
- [ ] Approve hard-cap and burn/reissuance semantics.
- [ ] Approve initial allocation and recipient.
- [ ] Approve transfer fee and fee collector.
- [ ] Define controller, governance, and emergency roles.
- [ ] Decide whether ICRC-2 is necessary.
- [ ] Document legal and operational constraints.

## Stage 2 — Implementation
- [ ] Implement or configure the ledger.
- [ ] Implement enforceable supply controls where needed.
- [ ] Remove ambiguous duplicate ledger definitions or clearly label test-only variants.
- [ ] Add Candid interfaces and generated bindings as applicable.
- [ ] Add sanitized configuration templates.
- [ ] Add build and test automation.

## Stage 3 — Verification
- [ ] Compile using a pinned toolchain.
- [ ] Run unit, integration, and adversarial tests.
- [ ] Verify supply arithmetic and all mint/burn paths.
- [ ] Test upgrades and state migration.
- [ ] Review controller and treasury separation.
- [ ] Conduct independent security review.

## Stage 4 — Testnet / controlled deployment
- [ ] Deploy only to the explicitly selected non-production network.
- [ ] Record canister IDs, Wasm hashes, commit SHA, and deployment evidence.
- [ ] Verify ledger metadata, balances, transfers, fees, supply, and cap behavior.
- [ ] Publish test results without credentials or secrets.

## Stage 5 — Mainnet release gate
- [ ] Written approval of final parameters and initial recipient.
- [ ] Reproducible build and reviewed Wasm hash.
- [ ] Independent review of controller permissions and supply invariant.
- [ ] Confirmed cycles, monitoring, recovery, and incident plans.
- [ ] Explicit release authorization.
- [ ] Deploy and independently verify canister IDs and on-chain behavior.

## Release principle

A completed checklist item requires evidence. Planning, source files, local builds, and testnet deployments must not be represented as a production mainnet launch.
