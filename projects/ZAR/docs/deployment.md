# ZAR Deployment and Release Checklist

## Current status

This file is a deployment procedure template. It does not claim that ZAR is deployed to mainnet.

## Before any deployment

1. Inspect the current repository and identify the exact source revision.
2. Verify network selection explicitly; never rely on an implicit default.
3. Confirm the identity principal without displaying any seed phrase or password.
4. Confirm the intended canister names and ensure there is only one official ledger definition.
5. Review all initialization arguments, including symbol, name, decimals, fee, minting authority, initial balances, archive settings, and controllers.
6. Verify that the initial balance sum equals the intended initial supply.
7. Confirm that the supply cap is enforced in code and tests, not merely described in configuration.
8. Build from reviewed source with a pinned toolchain and record the Wasm hash.
9. Run the complete test suite and inspect all failures.
10. Obtain explicit approval for the network, recipient, amount, fee, controllers, and release revision.

## After a test deployment

Record:
- network;
- deployment timestamp;
- source commit;
- toolchain versions;
- canister IDs;
- Wasm hashes;
- controller set (public identifiers only);
- ledger metadata and initial supply;
- test transaction references;
- test results and outstanding risks.

Do not record secret material or password files.

## Mainnet release

Mainnet deployment and any irreversible financial transfer require a separate explicit approval of the final parameters. A successful CLI command alone is not sufficient evidence of correct deployment. Independently query canister status, metadata, supply, balances, controller configuration, and representative transactions.

## Rollback and upgrades

Canister upgrades may be irreversible in practice if state migration or controller access is mishandled. Before an upgrade, verify the recovery plan, state compatibility, Wasm hash, controller authority, and post-upgrade tests. Never replace a live ledger merely to simplify project structure.
