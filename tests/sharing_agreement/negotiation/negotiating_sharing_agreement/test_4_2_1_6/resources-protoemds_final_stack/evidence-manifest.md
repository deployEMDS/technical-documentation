# Evidence manifest: 4.2.1.6 protoEMDS Final Stack

This manifest indexes the sanitized, versioned evidence for the CaaS assessment. Live evidence collection is in progress.

## Redaction rules

Do not commit secrets, credentials, bearer tokens, API keys, passwords, Vault material, kubeconfig data, internal IP addresses, full certificate chains, personal data, or unredacted application logs. Keep complete source captures in the approved protected evidence store.

Each committed artifact must state the capture date, executing role, command category, source capture reference, and SHA-256 hash of the protected original or sanitized capture, as appropriate.

## Deployment baseline

| Field | Value |
| --- | --- |
| Deployment model | CaaS / IONOS-managed deployment |
| Kubernetes context | `cluster-admin@EMDS-PROD` |
| Deployment repository | `deployEMDS-k8s-deployment` |
| Deployment branch | `prepare-prod` |
| Deployment revision | `846e5f1d7a388e664fe9e4942e553021752d63c6` |
| Assessment status | Live evidence collection in progress |

## Evidence index

| ID | Test step | Sanitized artifact | Protected source reference | SHA-256 | Capture date | Reviewer | Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| ENV-01 | Live environment inventory | [`env-01-live-cluster-inventory.md`](./env-01-live-cluster-inventory.md) | Sanitized terminal capture; no protected source retained | `1cc7c69d5ad98ec5803b84f0c5aa06abf8100321a21180e380c37cea9449c529` | 2026-08-13 | Pending | Collected; review Helm release status before final assessment |
| AUTH-01 | Live DSP authentication architecture | [`auth-01-live-authentication-configuration.md`](./auth-01-live-authentication-configuration.md) | Sanitized terminal capture; no protected source retained | `198c7523a8e2d77cc598a24469fc7751385d3a2355562f41ccbb0db2dde757ac` | 2026-08-13 | Pending | Collected; supporting configuration evidence only |
| TLS-01 | connector-a DID document and certificate validation | [`tls-01-connector-a-did-and-certificate.md`](./tls-01-connector-a-did-and-certificate.md) | Sanitized terminal capture; no protected source retained | `68b199d85a0a59ac47acb2d9fdb99ee8ee6eb4a8f5b55baaabf64b5666d7667f` | 2026-08-13 | Pending | Collected; DID advertises HTTPS DSP endpoint and certificate validation succeeded |
| TLS-02 | connector-b DID document and certificate validation | [`tls-02-connector-b-did-and-certificate.md`](./tls-02-connector-b-did-and-certificate.md) | Sanitized terminal capture; no protected source retained | `2db85e4473a16f25a8b0a985156bbfc4c51b9cfd49a71a0cd54e16cc15f5c994` | 2026-08-13 | Pending | Collected; DID advertises HTTPS DSP endpoint and certificate validation succeeded |
| TLS-03 | Plaintext DSP negative control | [`tls-01-connector-a-did-and-certificate.md`](./tls-01-connector-a-did-and-certificate.md); [`tls-02-connector-b-did-and-certificate.md`](./tls-02-connector-b-did-and-certificate.md) | Sanitized terminal capture; no protected source retained | See TLS-01 and TLS-02 | 2026-08-13 | Pending | Collected; both HTTP DSP routes return `308` redirects to HTTPS |
| NEG-01 | Successful authenticated provider-consumer negotiation | TBD | TBD | TBD | TBD | TBD | Pending |
| NEG-02 | Invalid or non-participant DSP authentication control | TBD | TBD | TBD | TBD | TBD | Pending |
| NEG-03 | Management API local-authentication control | [`neg-03-unauthenticated-management-api.md`](./neg-03-unauthenticated-management-api.md) | Sanitized terminal capture; no protected source retained | `615b1dca5b6d0b85a0d818301921910b24efd1bec73279beddf73ad5aa849ef7` | 2026-08-13 | Pending | Collected; both unauthenticated read-only asset queries returned `401 Unauthorized` |

## Open evidence items

`NEG-01` and `NEG-02` require an approved test asset, the connector owner's authenticated negotiation procedure, and an approved invalid or non-participant test identity. They must not be attempted with discovered configuration credentials or an unapproved asset because an EDC negotiation creates state. Until both controls are collected and correlated in the configured observability stack, no final score can be assigned for connector authentication.

## Negotiation correlation table

| Run ID | Initiator | Counterparty | HTTPS DSP endpoint | Negotiation or trace ID | Authentication result | Provider evidence | Consumer evidence | Outcome |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| TBD | TBD | TBD | TBD | TBD | TBD | TBD | TBD | Pending |

## Cross-test handoff

Evidence about authorization to negotiation APIs, status messages, or logs must be recorded for test `4.2.3.1`; it is not evidence for the score of this test. Credential lifecycle evidence belongs to test `1.3.1.5`.
