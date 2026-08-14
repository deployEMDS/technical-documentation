# Evidence manifest: 4.2.1.6 protoEMDS Final Stack

This manifest indexes the sanitized, versioned evidence for the CaaS assessment. Live evidence collection is in progress.

## Redaction rules

Do not commit secrets, credentials, bearer tokens, API keys, passwords, Vault material, kubeconfig data, internal IP addresses, full certificate chains, personal data, or unredacted application logs. Keep complete source captures in the approved protected evidence store.

Each committed artifact must state the capture date and command category, as appropriate.

## Deployment baseline

| Field | Value |
| --- | --- |
| Deployment model | CaaS / IONOS-managed deployment |
| Kubernetes context | `cluster-admin@EMDS-PROD` |
| Deployment repository | `deployEMDS-k8s-deployment` |
| Deployment branch | `prepare-prod` |
| Deployment revision | `846e5f1d7a388e664fe9e4942e553021752d63c6` |
| Assessment status | CaaS evidence collection complete |

## Evidence index

| ID | Test step | Sanitized artifact | Capture date | Status |
| --- | --- | --- | --- | --- |
| ENV-01 | Live environment inventory | [`env-01-live-cluster-inventory.md`](./env-01-live-cluster-inventory.md) | 2026-08-13 | Collected; review Helm release status before final assessment |
| AUTH-01 | Live DSP authentication architecture | [`auth-01-live-authentication-configuration.md`](./auth-01-live-authentication-configuration.md) | 2026-08-13 | Collected; supporting configuration evidence only |
| AUTH-02 | Kubernetes runtime configuration binding | [`auth-02-kubernetes-runtime-configuration-binding.md`](./auth-02-kubernetes-runtime-configuration-binding.md) | 2026-08-13 | Collected; selected non-secret settings confirmed in ready processes and required Secret key names verified without reading values |
| TLS-01 | connector-a DID document and certificate validation | [`tls-01-connector-a-did-and-certificate.md`](./tls-01-connector-a-did-and-certificate.md) | 2026-08-13 | Collected; DID advertises HTTPS DSP endpoint and certificate validation succeeded |
| TLS-02 | connector-b DID document and certificate validation | [`tls-02-connector-b-did-and-certificate.md`](./tls-02-connector-b-did-and-certificate.md) | 2026-08-13 | Collected; DID advertises HTTPS DSP endpoint and certificate validation succeeded |
| TLS-03 | Plaintext DSP negative control | [`tls-01-connector-a-did-and-certificate.md`](./tls-01-connector-a-did-and-certificate.md); [`tls-02-connector-b-did-and-certificate.md`](./tls-02-connector-b-did-and-certificate.md) | 2026-08-13 | Collected; both HTTP DSP routes return `308` redirects to HTTPS |
| AUTH-03 | Supporting management API local-authentication control | [`neg-03-unauthenticated-management-api.md`](./neg-03-unauthenticated-management-api.md) | 2026-08-13 | Collected; both unauthenticated read-only asset queries returned `401 Unauthorized`; not proof of DSP authentication |
| DSP-01 | Approved minimal negotiation using existing catalog offer | [`dsp-01-approved-minimal-negotiation.md`](./dsp-01-approved-minimal-negotiation.md) | 2026-08-13 | Collected; `asset1` / `policy1` / `contract3` payloads and mapping verified, both connector negotiations finalized, and no direct authentication-decision record found |
| UI-01 | Supplementary dashboard TLS and login | [`ui-01-dashboard-tls-login.md`](./ui-01-dashboard-tls-login.md) | 2026-08-13 | Collected; HTTPS dashboard route and API-key access model verified |
| LOG-01 | Supplementary observability storage and access | [`log-01-observability-storage-access.md`](./log-01-observability-storage-access.md) | 2026-08-13 | Collected; persistence verified, but Jaeger trace access is unauthenticated inside the cluster and storage/transport gaps are documented |

## Assessment boundary

An approved minimal negotiation may be executed only to evidence the encrypted connector-to-connector DSP exchange. It must reuse the provider's existing catalog offer for `asset1`; it does not assess the `policy1` or `contract3` semantics. Contract definition belongs to [test `4.2.1.3`](../../test_4_2_1_3/test.md), while invalid/non-participant DSP negotiation and access restrictions for negotiation APIs, statuses, and logs belong to [test `4.2.3.1`](../../../refusal_or_registration_of_sharing_agreement/test_4_2_3_1/test.md).

`DSP-01` completed with both connectors reaching `FINALIZED` for the same agreement over the validated HTTPS DSP path. Together with the TLS and runtime configuration evidence, the proposed score is `4` (Full Coverage).

## Cross-test handoff

Evidence about contract definition using claims, policies, and service agreements belongs to test `4.2.1.3`. Evidence about authorization to negotiation APIs, status messages, or logs belongs to test `4.2.3.1`; neither is evidence for the score of this test. Credential lifecycle evidence belongs to test `1.3.1.5`.
