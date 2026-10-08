# GERAM Ecosystem Architecture v2.1.0

This directory contains the master architecture reference for the
GERAM Ecosystem.

The ecosystem consists of four separate projects:

1. GERAM
2. HamiFund
3. NFID
4. FlowChain

Each project has its own source code, implementation lifecycle,
responsibilities and source-of-truth boundaries.

Approved development sequence:

GERAM -> HamiFund -> NFID -> FlowChain

NFID and FlowChain are prepared as future development workspaces.
Their architecture and integration boundaries are defined before
their implementation begins.

The master architecture must not copy the source code of another
project into GERAM.

Cross-project functionality must use defined APIs, Candid interfaces,
events, integration contracts and other approved interfaces.

Core rule:

Digital Representation != Underlying Asset
