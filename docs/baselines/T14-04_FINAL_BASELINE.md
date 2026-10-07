# T14-04 FINAL BASELINE
## GERAM ? RWA-NFT 1:1 Identity

Status: PASS / CLOSED / FROZEN
Version: 1.0.0

### Canonical Identity Invariant

1 GERAM = 1 Certificate = 1 RWA-NFT Token = 1 Current Holder.

### Canonical Mapping

GERAM.issuance_id
? GeramCertificate.certificate_id
? GeramCertificate.token_id
? ICRC-7 owner_of(token_id)

### Frozen Rules

- GERAM does not maintain a parallel NFT ownership registry.
- ICRC-7 is the source of truth for current NFT ownership.
- Geram does not require a token_id field; the canonical mapping is through issuance_id and Certificate.
- certificate_id must be unique before mint.
- geram_id must be unique before mint.
- token_id is allocated by the existing GERAM NFT allocator.
- NFT is minted directly to request.initial_holder.
- No additional T14-04 API is required.
- No change to the frozen Geram model is required.
- No financial-service logic is introduced into GERAM Core.

### Live Proof

Certificate:
T14-03-POSITIVE-NEW-001

Token:
1_000_009

Certificate initial_holder:
2vxsx-fae

ICRC-7 owner:
2vxsx-fae

Project:
F18-03-PROJECT-001

### Verification

Certificate query returned token_id = 1_000_009.

ICRC-7 owner_of(1_000_009) returned owner = 2vxsx-fae.

ICRC-7 metadata returned certificate_id = T14-03-POSITIVE-NEW-001
and token_id = 1_000_009.

### Implementation Audit

certificate_id uniqueness guard: PASS
geram_id uniqueness guard: PASS
token allocator: existing canonical allocator
direct mint to initial_holder: PASS
build: PASS

### Decision

T14-04 is CLOSED and FROZEN.
No implementation change is required for T14-04.
Future changes require Change Request ? Impact Analysis ? Decision ? Freeze ? Implementation.
