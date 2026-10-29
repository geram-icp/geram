# ZAR — Source Workspace

This directory is the source-code workspace for the ZAR project, a subproject of GERAM-ICP.

## Purpose

- Keep reviewed, publishable ZAR source code and API specifications organized.
- Separate implementation files from project-level whitepaper and planning documents under `projects/ZAR/`.
- Prepare for controlled synchronization from the ZAR server.

## Security rules

- Never commit private keys, identity password files, access tokens, `.env` files, credentials, user data, database dumps, or production secrets.
- Do not commit local identity stores or build artifacts unless explicitly reviewed and required.
- Do not copy backup files ending in `.bak` into this workspace.
- Review the staged file list before every commit and push.
- Keep deployments and production changes separate from source synchronization.

## Current status

Workspace initialized. Server source synchronization has not yet been performed.
