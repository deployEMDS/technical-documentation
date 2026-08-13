# AUTH-01: live authentication configuration summary

| Field | connector-a | connector-b |
| --- | --- | --- |
| Capture date | 2026-08-13 | 2026-08-13 |
| Participant and issuer identity | `did:web:connector-a.194-164-194-95.sslip.io` | `did:web:connector-b.194-164-194-95.sslip.io` |
| DSP callback address | `https://connector-a.194-164-194-95.sslip.io/api/dsp` | `https://connector-b.194-164-194-95.sslip.io/api/dsp` |
| DID web HTTPS enforcement | Enabled | Enabled |
| STS token service | Configured | Configured |
| OpenTelemetry traces | Enabled | Enabled |

The inspected control-plane configuration associates each connector with a `did:web` participant identity, configures a local STS token service, and enables OpenTelemetry tracing. It is supporting evidence for the deployed authentication architecture, not proof of an authenticated DSP negotiation.

## Security observation and handoff

During the non-secret ConfigMap inspection, a credential-like configuration value was visible in a ConfigMap. Its name and value are intentionally omitted from this artifact. Configuration values that function as credentials must be kept in a Kubernetes Secret or an approved secret manager rather than a ConfigMap. This observation is outside the score of test `4.2.1.6` and must be handed to the owner of test `4.2.3.1` and the deployment owner for remediation.

## Collection method

Only explicitly selected, non-secret architecture values were recorded. No Secret was read and no credential-bearing ConfigMap value is retained in this artifact.

```sh
for configmap in connector-a-controlplane connector-b-controlplane
  kubectl --context cluster-admin@EMDS-PROD get configmap "$configmap" \
    -n connector -o json | jq '.data | {
      EDC_DSP_CALLBACK_ADDRESS,
      EDC_IAM_DID_WEB_USE_HTTPS,
      EDC_IAM_ISSUER_ID,
      EDC_IAM_STS_OAUTH_TOKEN_URL,
      EDC_PARTICIPANT_ID,
      OTEL_AGENT_ENABLED,
      OTEL_TRACES_EXPORTER
    }'
end
```
