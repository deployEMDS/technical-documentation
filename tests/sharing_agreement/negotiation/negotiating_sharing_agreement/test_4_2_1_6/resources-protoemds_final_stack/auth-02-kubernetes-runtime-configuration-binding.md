# AUTH-02: Kubernetes runtime configuration binding

This evidence verifies configuration delivery to the running Kubernetes control planes and confirms an allow-listed set of non-secret environment variables. It does not read Secret values.

| Field | connector-a | connector-b |
| --- | --- | --- |
| Capture date | 2026-08-13 | 2026-08-13 |
| Control-plane Deployment | `connector-a-controlplane` | `connector-b-controlplane` |
| Deployment generation / observed generation | `4 / 4` | `2 / 2` |
| Ready replicas | `1` | `1` |
| ConfigMap imported through `envFrom` | `connector-a-controlplane` | `connector-b-controlplane` |
| Required non-secret keys present in source ConfigMap | DSP callback, DID issuer, participant ID, STS token URL, OpenTelemetry traces | DSP callback, DID issuer, participant ID, STS token URL, OpenTelemetry traces |
| Ready control-plane Pod | `connector-a-controlplane-7cf9b77f66-v4rjf` | `connector-b-controlplane-95f45f8b4-xg74v` |
| Pod state | `Running`, control-plane container ready | `Running`, control-plane container ready |
| Control-plane image | `ghcr.io/deployemds/emds-edc-connector:controlplane-9916cc56b682ae70988300d301b752ca8eb05121` | `ghcr.io/deployemds/emds-edc-connector:controlplane-9916cc56b682ae70988300d301b752ca8eb05121` |
| Management-auth Secret reference | `connector-a-db-credentials` | `connector-b-db-credentials` |
| Required referenced Secret keys present | `EDC_API_KEY`, `CONNECTOR_DB_PASSWORD` | `EDC_API_KEY`, `CONNECTOR_DB_PASSWORD` |
| Runtime DSP callback address | `https://connector-a.194-164-194-95.sslip.io/api/dsp` | `https://connector-b.194-164-194-95.sslip.io/api/dsp` |
| Runtime DID web HTTPS setting | `true` | `true` |
| Runtime issuer and participant ID | `did:web:connector-a.194-164-194-95.sslip.io` | `did:web:connector-b.194-164-194-95.sslip.io` |
| Runtime STS token URL | `http://connector-a-sts:8082/api/sts/token` | `http://connector-b-sts:8082/api/sts/token` |
| Runtime trace exporter | `otlp` | `otlp` |

The Kubernetes Deployment templates bind their corresponding non-secret control-plane ConfigMaps through `envFrom`. Their observed generations match their desired generations, and each controls a ready running Pod using the recorded image. An allow-listed process-environment inspection confirmed that both ready control-plane containers received the expected DSP, DID, STS, and OpenTelemetry values.

The Deployment templates also reference the corresponding `Opaque` credential Secret for `EDC_API_KEY` and `CONNECTOR_DB_PASSWORD`, and both named keys exist in the referenced Secret objects. Secret values were not read. `EDC_API_KEY` supports the local management API authentication control only; it is not DSP connector-authentication evidence.

Only the six listed non-secret variables were printed. No unfiltered environment dump or Secret read was performed. This evidence confirms the selected runtime settings, but is not proof of a completed DSP authentication exchange.

## Collection method

The commands below query deployment, Pod, selected non-secret ConfigMap metadata, and Secret metadata/key names, then print only an allow-listed set of non-secret environment variables. They do not retrieve Secret values.

```sh
kubectl --context cluster-admin@EMDS-PROD get deployment \
  connector-a-controlplane connector-b-controlplane \
  -n connector -o json

kubectl --context cluster-admin@EMDS-PROD get pods \
  -n connector -l app.kubernetes.io/name=controlplane -o json

kubectl --context cluster-admin@EMDS-PROD get configmap \
  connector-a-controlplane connector-b-controlplane \
  -n connector -o json

kubectl --context cluster-admin@EMDS-PROD get secret \
  connector-a-db-credentials connector-b-db-credentials \
  -n connector -o json

kubectl --context cluster-admin@EMDS-PROD exec -n connector \
  <controlplane-pod> -c controlplane -- sh -c \
  'for name in EDC_DSP_CALLBACK_ADDRESS EDC_IAM_DID_WEB_USE_HTTPS EDC_IAM_ISSUER_ID EDC_IAM_STS_OAUTH_TOKEN_URL EDC_PARTICIPANT_ID OTEL_TRACES_EXPORTER; do printenv "$name"; done'
```