# Reproducible execution runbook: 4.2.1.6

This runbook defines how to assess encrypted DSP communication and connector authentication for the protoEMDS Final Stack.

It is the execution companion to [`../test.md`](../test.md). The assessment record is [`../result_protoemds_final_stack.md`](../result_protoemds_final_stack.md), and the sanitized evidence index is [`../resources-protoemds_final_stack/evidence-manifest.md`](../resources-protoemds_final_stack/evidence-manifest.md).

## Scope

This runbook assesses only the two requirements of test `4.2.1.6`:

1. The DSP negotiation channel is protected by TLS.
2. Connector authentication is performed for the data-sharing negotiation.

Authorization to negotiation APIs, status messages, and logs is assessed separately by test `4.2.3.1`. Credential lifecycle, claims, usage policies, and UI login are not scored by this runbook.

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

- Use only the approved provider and consumer test connectors, test asset, and invalid/non-participant test identity.
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

Obtain the authenticated negotiation procedure and the approved invalid/non-participant input from the connector owner. The installed EDC authentication mechanism must be identified before a protocol request is sent; do not infer it from the management API authentication mechanism.

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
- the deployed observability service used for trace correlation.

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

## Step 4: execute and correlate an authenticated negotiation

Execute one approved provider-consumer negotiation using the connector owner's documented client procedure. Do not place request credentials or credential presentations in this repository.

Record the following in a sanitized correlation table:

| Field | Required evidence |
| --- | --- |
| Initiating connector | Consumer DID or approved redacted identifier |
| Counterparty connector | Provider DID or approved redacted identifier |
| Transport endpoint | HTTPS DSP URL |
| Negotiation identifier | Redacted identifier or deterministic hash |
| Authentication result | Accepted connector/participant identity mechanism |
| Provider evidence | Sanitized log or trace reference |
| Consumer evidence | Sanitized log or trace reference |
| Outcome | Negotiation processed or rejected |

Expected outcome: a negotiation sent over the discovered HTTPS DSP URL is processed by the intended counterparty, and provider and consumer observations can be correlated by a non-sensitive negotiation or trace identifier.

## Step 5: run approved negative controls

Run only with approved test identities and non-production test assets.

| Check | Method | Expected outcome |
| --- | --- | --- |
| Management API without valid local credentials | Harmless read-only request to `/api/management/` | Denied; do not treat management credentials as DSP authentication evidence. |
| DSP negotiation with invalid or non-participant identity | Connector-owner-approved invalid negotiation request | Denied before a contract negotiation proceeds. |
| Plaintext DSP route | Step 3 HTTP `HEAD` request | Redirected, rejected, or unavailable. |

Record only request category, status/result, timestamp, and correlated sanitized evidence reference. Do not record tokens, request bodies containing credentials, or full response bodies.

## Step 6: determine the score

| Score | Evidence threshold |
| ---: | --- |
| 0 | Neither encrypted DSP communication nor connector authentication is demonstrated. |
| 1 | Only partial or configuration-only evidence is available. |
| 2 | Exactly one of TLS or connector authentication is demonstrated live. |
| 3 | Both are demonstrated live, but a material limitation remains. |
| 4 | Valid TLS, successful authenticated negotiation, approved authentication failure control, and end-to-end correlation are all demonstrated. |

Document unavailable controls as limitations. Do not assign a score from Helm values or Ingress configuration alone.

## Evidence completion

1. Add a row for each executed step to [`../resources-protoemds_final_stack/evidence-manifest.md`](../resources-protoemds_final_stack/evidence-manifest.md).
2. Commit sanitized artifacts only after a second reviewer confirms redaction.
3. Complete [`../result_protoemds_final_stack.md`](../result_protoemds_final_stack.md) with the selected score, CaaS assessment, and evidence links.
4. Mark the on-premise deployment `Not assessed` unless separate on-premise evidence is collected.
