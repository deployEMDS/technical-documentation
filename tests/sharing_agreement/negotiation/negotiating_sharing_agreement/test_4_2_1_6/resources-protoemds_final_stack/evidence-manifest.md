# Evidence manifest: 4.2.1.6 protoEMDS Final Stack

This manifest indexes the sanitized, versioned evidence for the CaaS assessment. It is intentionally empty until the live assessment is performed.

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
| Assessment status | Pending live evidence collection |

## Evidence index

| ID | Test step | Sanitized artifact | Protected source reference | SHA-256 | Capture date | Reviewer | Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| ENV-01 | Live environment inventory | TBD | TBD | TBD | TBD | TBD | Pending |
| TLS-01 | Provider DID document and certificate validation | TBD | TBD | TBD | TBD | TBD | Pending |
| TLS-02 | Consumer DID document and certificate validation | TBD | TBD | TBD | TBD | TBD | Pending |
| TLS-03 | Plaintext DSP negative control | TBD | TBD | TBD | TBD | TBD | Pending |
| NEG-01 | Successful authenticated provider-consumer negotiation | TBD | TBD | TBD | TBD | TBD | Pending |
| NEG-02 | Invalid or non-participant DSP authentication control | TBD | TBD | TBD | TBD | TBD | Pending |
| NEG-03 | Management API local-authentication control | TBD | TBD | TBD | TBD | TBD | Pending |

## Negotiation correlation table

| Run ID | Initiator | Counterparty | HTTPS DSP endpoint | Negotiation or trace ID | Authentication result | Provider evidence | Consumer evidence | Outcome |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| TBD | TBD | TBD | TBD | TBD | TBD | TBD | TBD | Pending |

## Cross-test handoff

Evidence about authorization to negotiation APIs, status messages, or logs must be recorded for test `4.2.3.1`; it is not evidence for the score of this test. Credential lifecycle evidence belongs to test `1.3.1.5`.
