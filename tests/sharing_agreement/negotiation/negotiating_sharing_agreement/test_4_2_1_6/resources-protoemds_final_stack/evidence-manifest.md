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
| AUTH-02 | Kubernetes runtime configuration binding | [`auth-02-kubernetes-runtime-configuration-binding.md`](./auth-02-kubernetes-runtime-configuration-binding.md) | Sanitized terminal capture; no protected source retained | `83b29477b12636f89a58ec2e99ca3ff5b3e7cc589047368685a510bbc75ebbf8` | 2026-08-13 | Pending | Collected; selected non-secret settings confirmed in ready processes and required Secret key names verified without reading values |
| TLS-01 | connector-a DID document and certificate validation | [`tls-01-connector-a-did-and-certificate.md`](./tls-01-connector-a-did-and-certificate.md) | Sanitized terminal capture; no protected source retained | `68b199d85a0a59ac47acb2d9fdb99ee8ee6eb4a8f5b55baaabf64b5666d7667f` | 2026-08-13 | Pending | Collected; DID advertises HTTPS DSP endpoint and certificate validation succeeded |
| TLS-02 | connector-b DID document and certificate validation | [`tls-02-connector-b-did-and-certificate.md`](./tls-02-connector-b-did-and-certificate.md) | Sanitized terminal capture; no protected source retained | `2db85e4473a16f25a8b0a985156bbfc4c51b9cfd49a71a0cd54e16cc15f5c994` | 2026-08-13 | Pending | Collected; DID advertises HTTPS DSP endpoint and certificate validation succeeded |
| TLS-03 | Plaintext DSP negative control | [`tls-01-connector-a-did-and-certificate.md`](./tls-01-connector-a-did-and-certificate.md); [`tls-02-connector-b-did-and-certificate.md`](./tls-02-connector-b-did-and-certificate.md) | Sanitized terminal capture; no protected source retained | See TLS-01 and TLS-02 | 2026-08-13 | Pending | Collected; both HTTP DSP routes return `308` redirects to HTTPS |
| AUTH-03 | Supporting management API local-authentication control | [`neg-03-unauthenticated-management-api.md`](./neg-03-unauthenticated-management-api.md) | Sanitized terminal capture; no protected source retained | `615b1dca5b6d0b85a0d818301921910b24efd1bec73279beddf73ad5aa849ef7` | 2026-08-13 | Pending | Collected; both unauthenticated read-only asset queries returned `401 Unauthorized`; not proof of DSP authentication |

## Assessment boundary

This assessment intentionally does not execute a contract negotiation or an invalid/non-participant DSP negotiation. Those state-changing checks belong to [test `4.2.1.3`](../../test_4_2_1_3/test.md), which assesses contract definition, and [test `4.2.3.1`](../../../refusal_or_registration_of_sharing_agreement/test_4_2_3_1/test.md), which assesses access restrictions for negotiation APIs, statuses, and logs.

The collected evidence supports a maximum score of `2` (Partial Coverage) in this scope. It demonstrates encrypted DSP transport and a deployed DSP identity/authentication architecture, but does not prove that connector authentication occurred in a completed negotiation.

## Cross-test handoff

Evidence about contract definition using claims, policies, and service agreements belongs to test `4.2.1.3`. Evidence about authorization to negotiation APIs, status messages, or logs belongs to test `4.2.3.1`; neither is evidence for the score of this test. Credential lifecycle evidence belongs to test `1.3.1.5`.
