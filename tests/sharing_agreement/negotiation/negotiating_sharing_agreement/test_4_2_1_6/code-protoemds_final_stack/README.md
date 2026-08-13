# Reproducible execution runbook: 4.2.1.6

This runbook defines how to assess encrypted DSP communication and connector authentication for the protoEMDS Final Stack.

It is the execution companion to [`../test.md`](../test.md). The assessment record is [`../result_protoemds_final_stack.md`](../result_protoemds_final_stack.md), and the sanitized evidence index is [`../resources-protoemds_final_stack/evidence-manifest.md`](../resources-protoemds_final_stack/evidence-manifest.md).

## Scope

This runbook assesses the following within the agreed Security and Restricted Access scope for test `4.2.1.6`:

1. The DSP negotiation channel is protected by TLS.
2. The deployed DSP identity and authentication architecture is present and operationally evidenced.

This assessment does not assess contract definition using claims, usage policies, or service agreements; those belong to [test `4.2.1.3`](../../test_4_2_1_3/test.md). One approved minimal negotiation may be executed solely to evidence the encrypted connector-to-connector DSP exchange. It must reuse an existing published offer and does not score the policy or contract semantics. Authorization to negotiation APIs, status messages, and logs is assessed separately by [test `4.2.3.1`](../../../refusal_or_registration_of_sharing_agreement/test_4_2_3_1/test.md). Credential lifecycle and UI login are also not scored by this runbook.

## Deployment baseline

| Field | Value |
| --- | --- |
| Deployment model | CaaS / IONOS-managed deployment |
| Kubernetes context | `cluster-admin@EMDS-PROD` |
| Deployment repository | `deployEMDS-k8s-deployment` |
| Deployment branch | `prepare-prod` |
| Deployment revision | `846e5f1d7a388e664fe9e4942e553021752d63c6` |
| Expected DSP path | `https://<connector-host>/api/dsp` |
| Expected DID document path | `https://<connector-host>/.well-known/did.json` |
| Expected management path | `https://<connector-host>/api/management/` |

The deployment revision is a baseline, not evidence of its current live state. Record the deployed Helm release names, image versions, routes, and certificate status before executing the protocol checks.

## Safety and redaction

- Do not run write, delete, patch, apply, rollout, or shell-exec Kubernetes commands for this assessment.
- Do not put kubeconfig content, tokens, API keys, passwords, Vault material, unredacted logs, full certificate chains, internal IP addresses, or personal data in this repository.
- Do not use `curl --insecure` as evidence of TLS. Certificate hostname and trust validation must succeed without it.
- Store complete operational captures in the approved protected evidence store. Commit only sanitized summaries and hashes listed in the evidence manifest.

## Required inputs

Set only non-secret values in the current shell. Do not export secrets into shell history.

```sh
export KUBE_CONTEXT='cluster-admin@EMDS-PROD'
export PROVIDER_HOST='<provider public hostname>'
export CONSUMER_HOST='<consumer public hostname>'
export PROVIDER_DID='did:web:<provider public hostname>'
export CONSUMER_DID='did:web:<consumer public hostname>'
export DEPLOYMENT_REVISION='846e5f1d7a388e664fe9e4942e553021752d63c6'
```

Identify the deployed DSP authentication mechanism from non-secret configuration and public DID evidence. Do not infer DSP authentication from the management API authentication mechanism.

For the optional minimal negotiation, obtain the consumer management API credential through an approved local method. Do not provide it in chat, commit it to the repository, place it in a request capture, or substitute a credential discovered from cluster configuration.

## Effective runtime configuration evidence

Configuration source files and deployment manifests show intended configuration. This test also requires evidence that the running connector consumes the intended configuration source. Record the deployment-specific mechanism used and any limitation on process-level verification.

| Deployment model | Effective configuration evidence |
| --- | --- |
| Kubernetes | Workload template binding to ConfigMaps, Secrets, or mounted files; observed Deployment revision; and a ready running Pod created from that template. |
| Docker or Docker Compose | Running container image/ID plus its non-secret environment and mounted configuration-file bindings. |
| VM or bare metal | Running service/process status plus the rendered properties file or service-unit environment it consumes. |
| Managed platform | Deployed revision, platform configuration export, and running health/status evidence. |

An approved non-sensitive diagnostics endpoint, startup log, or allow-listed runtime environment inspection may provide stronger process-level confirmation. Never run an unfiltered environment dump or read secret values. If process-level inspection is unavailable, state that the evidence proves configuration delivery to the runtime rather than the exact effective process environment.

## Step 1: capture the live environment inventory

Run read-only resource discovery. Do not retrieve Secret data.

```sh
kubectl --context "$KUBE_CONTEXT" get ns
kubectl --context "$KUBE_CONTEXT" get deploy,sts,ds,svc,ingress,certificate -A
kubectl --context "$KUBE_CONTEXT" get gateway,httproute -A
kubectl --context "$KUBE_CONTEXT" get networkpolicy -A
helm --kube-context "$KUBE_CONTEXT" list --all-namespaces
```

Record, after redaction:

- namespaces and connector Helm release names;
- connector control-plane, data-plane, identity-hub, STS, and proxy workload image versions;
- public Ingress or Gateway hostnames and TLS certificate readiness;
- the provider and consumer `did:web` values; and
- the deployed STS and observability components.

Expected outcome: two intended connector tenants and their public routes can be identified, and the TLS certificate resource or trusted public certificate can be associated with each DSP hostname.

## Step 2: validate DID documents and TLS

The DID document establishes the expected protocol endpoint. Retrieve it over HTTPS and validate its advertised endpoint before checking the DSP route.

```sh
curl --fail --silent --show-error \
  "https://$PROVIDER_HOST/.well-known/did.json"
curl --fail --silent --show-error \
  "https://$CONSUMER_HOST/.well-known/did.json"

openssl s_client -connect "$PROVIDER_HOST:443" -servername "$PROVIDER_HOST" \
  -verify_return_error </dev/null
openssl s_client -connect "$CONSUMER_HOST:443" -servername "$CONSUMER_HOST" \
  -verify_return_error </dev/null
```

Record the sanitized response status, certificate subject/SAN, issuer, expiry date, verification result, and the `ProtocolEndpoint` value. Do not commit the full DID document when it contains identifying or environment-sensitive values.

Expected outcome: both DID documents are fetched with a valid certificate, and each advertised DSP endpoint uses `https://<host>/api/dsp`.

## Step 3: verify plaintext is not a usable DSP channel

Use a harmless `HEAD` request and do not follow redirects automatically.

```sh
curl --head --silent --show-error --output /dev/null --write-out '%{http_code}\n' \
  "http://$PROVIDER_HOST/api/dsp"
curl --head --silent --show-error --output /dev/null --write-out '%{http_code}\n' \
  "http://$CONSUMER_HOST/api/dsp"
```

Expected outcome: HTTP is redirected to HTTPS, rejected, or unavailable. It must not provide a usable plaintext DSP negotiation route.

## Step 4: verify effective DSP identity and authentication configuration

Establish the configuration-delivery chain from the deployment-specific source to a ready connector runtime. For Kubernetes, inspect the control-plane Deployment template for ConfigMap, Secret, or mounted-file bindings; record its observed generation and a ready Pod controlled by that template. For other deployment models, use the equivalent evidence listed above.

Then inspect non-secret identity/authentication values and public DID documents. Record only the following:

| Field | Required evidence |
| --- | --- |
| Runtime configuration delivery | Deployment-specific source binding and ready runtime revision |
| Connector identity | `did:web` participant and issuer identifier |
| DSP identity binding | HTTPS DSP callback address and DID `ProtocolEndpoint` |
| Authentication component | Configured STS token-service endpoint |
| Trace support | Enabled OpenTelemetry configuration |

Expected outcome: each connector's public DID, delivered runtime configuration, and control-plane configuration consistently identify the HTTPS DSP endpoint and the deployed identity/authentication components.

When a deployment injects secrets, record only the Secret reference and required key names. Do not read or print Secret values. A local management API key is supporting management-access evidence and must not be presented as DSP connector-authentication evidence.

Where permitted, Kubernetes may provide stronger process-level evidence using `kubectl exec` with a fixed allow-list. Do not run `printenv` or `env` without selecting named variables first.

```sh
kubectl --context "$KUBE_CONTEXT" exec -n connector \
  <controlplane-pod> -c controlplane -- sh -c \
  'for name in EDC_DSP_CALLBACK_ADDRESS EDC_IAM_DID_WEB_USE_HTTPS EDC_IAM_ISSUER_ID EDC_IAM_STS_OAUTH_TOKEN_URL EDC_PARTICIPANT_ID OTEL_TRACES_EXPORTER; do printenv "$name"; done'
```

## Step 5: verify supporting local management API authentication

Use a harmless, read-only request without credentials.

| Check | Method | Expected outcome |
| --- | --- | --- |
| Management API without valid local credentials | Harmless read-only request to `/api/management/` | Denied; do not treat management credentials as DSP authentication evidence. |

Record only the request category, status/result, and sanitized evidence reference. Do not record tokens or full response bodies.

## Step 6: execute an approved minimal DSP negotiation

This step is optional until the connector owner approves the use of an existing offer. It creates a negotiation record, but must not create, update, or delete any asset, policy, contract definition, participant, or credential.

1. Identify provider and consumer by sending an authenticated catalog request from one connector to the other.
2. Continue only when the catalog response contains the approved existing dataset `asset1` and its provider-issued offer. Confirm with the provider owner that this offer corresponds to the existing `policy1` and `contract3` setup.
3. Preserve the complete offer object from the catalog response. Do not recreate the offer or manually construct policy or contract identifiers.
4. Confirm the deployed EDC `0.10.0` contract-negotiation request schema from an approved client or the deployed API documentation before sending the request.
5. Initiate exactly one negotiation from the consumer management API using the provider DID, the HTTPS DSP endpoint, and the unchanged catalog offer.
6. Poll the negotiation state and agreement endpoints until a terminal result is reached. Do not initiate a data transfer.
7. Capture the consumer negotiation ID, final state, agreement reference, provider/consumer DIDs, HTTPS DSP endpoint, and a sanitized provider or consumer trace/log reference.

Stop without sending a negotiation request when any of these conditions applies:

- `asset1` is absent from the provider catalog;
- the catalog does not return the intended existing offer;
- the provider owner cannot confirm the `asset1` / `policy1` / `contract3` mapping;
- the deployed request schema or consumer management credential is unavailable; or
- the approval is limited to read-only operations.

The catalog request uses the consumer management API and is expected to have this shape. Replace only the placeholders with the discovered provider values and the locally supplied consumer credential.

```json
{
  "@context": {
    "edc": "https://w3id.org/edc/v0.0.1/ns/"
  },
  "@type": "CatalogRequest",
  "counterPartyAddress": "https://<provider-host>/api/dsp",
  "counterPartyId": "did:web:<provider-host>",
  "protocol": "dataspace-protocol-http",
  "querySpec": {
    "offset": 0,
    "limit": 50
  }
}
```

Do not commit the catalog response, request body, management credential, or agreement content. The evidence artifact records only the sanitized identifiers and outcome listed above.

## Step 7: determine the score

| Score | Evidence threshold |
| ---: | --- |
| 0 | Neither encrypted DSP communication nor connector authentication is demonstrated. |
| 1 | TLS or the deployed DSP identity/authentication architecture is only partially evidenced. |
| 2 | Valid TLS is demonstrated for both DSP endpoints and the deployed DSP identity/authentication architecture is consistently evidenced by public DID, non-secret configuration, and runtime configuration delivery. |
| 3 | Score 2 evidence plus one successful existing-offer negotiation over the HTTPS DSP endpoint, correlated with a sanitized connector log or trace reference. |
| 4 | Score 3 evidence plus direct evidence that the expected connector identity was authenticated by the counterpart, with no material limitation in this test's scope. |

Apply `0`–`4` after reviewing the negotiated exchange. A completed negotiation does not prove policy semantics, usage rights, or access authorization; those remain with their owning tests.

## Evidence completion

1. Add a row for each executed step to [`../resources-protoemds_final_stack/evidence-manifest.md`](../resources-protoemds_final_stack/evidence-manifest.md).
2. Commit sanitized artifacts only after a second reviewer confirms redaction.
3. Complete [`../result_protoemds_final_stack.md`](../result_protoemds_final_stack.md) with the selected score, CaaS assessment, and evidence links.
4. Mark the on-premise deployment `Not assessed` unless separate on-premise evidence is collected.
