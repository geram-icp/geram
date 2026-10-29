# ZAR — GERAM-ICP Subproject

ZAR is a subproject within the GERAM-ICP ecosystem. This directory is the canonical starting point for ZAR-specific technical documentation, implementation planning, security controls, and release evidence.

## Status

**Status: design and implementation preparation. Not production-deployed or independently audited.**

The repository currently contains GERAM ecosystem materials and an ICP application. Do not assume that existing canisters or sample code implement the ZAR token.

## Initial design parameters

- Token symbol: `ZAR`
- Token name: `ZAR Token` (working name)
- Decimal places: `3`
- Intended initial supply: `133,000,000,000,000 ZAR`
- Corresponding base units at 3 decimals: `133000000000000000`
- Intended supply ceiling: equal to the initial supply, subject to implementation and independent tests
- Network: Internet Computer (ICP)
- Token interface under evaluation: ICRC-1; ICRC-2 only if allowance-based transfers are required and reviewed

These are project requirements, not evidence of a deployed token or a legally guaranteed valuation.

## Architecture rule

GERAM-ICP is the parent project; ZAR is a child project. The GERAM asset registry, ZAR token ledger, treasury, governance, and any market integrations must remain distinct domains with explicit authority boundaries.

## Documents

- [Architecture](docs/architecture.md)
- [Tokenomics and supply controls](docs/tokenomics.md)
- [Security model](docs/security.md)
- [Implementation roadmap](docs/roadmap.md)
- [Deployment and release checklist](docs/deployment.md)
- [Decision log](decisions/README.md)

## Safety and release policy

1. Never commit seed phrases, private keys, passwords, access tokens, or identity password files.
2. Do not deploy to mainnet until the canister design, controllers, mint authority, initial recipient, fee, and supply invariant are reviewed.
3. Do not claim a hard supply cap unless code and adversarial tests demonstrate that minting cannot exceed it.
4. Burning must reduce circulating and total supply permanently; burned units must not be re-mintable under the cap policy.
5. Keep treasury custody separate from mint authorization wherever practical.
6. Treat this repository as the source of documentation and reviewed code; record deployment IDs and evidence only after independently verifying them.

## Current limitations

This baseline documents the intended design. It does not itself implement a ledger, enforce a cap, prove legal rights, provide a price, or constitute an audit.
