---
sidebar_position: 3
---

# protoEMDS final stack security assessment

The protoEMDS Final Stack assessment uses the existing stack-agnostic test catalogue and records a separate integration-phase result for the deployed EDC-based infrastructure.

For reproducibility, each assessment has three linked artifacts:

1. The test-local runbook documents prerequisites, safe commands, expected observations, and scoring rules.
2. The versioned evidence manifest indexes sanitized command outputs, TLS observations, and negotiation correlation records.
3. The result file records the deployment model, assessment outcome, limitations, and selected score.

The Kubernetes deployment itself remains authoritative in the `deployEMDS-k8s-deployment` repository. An assessment must pin the exact deployment branch and commit it evaluated rather than copying Helm values, credentials, or environment-specific configuration into this repository.

## Security and restricted access

Test `4.2.1.6` assesses encrypted DSP negotiation and connector authentication. Its reproducibility pack is located at:

```text
tests/sharing_agreement/negotiation/negotiating_sharing_agreement/
test_4_2_1_6/
├── code-protoemds_final_stack/README.md
├── resources-protoemds_final_stack/evidence-manifest.md
└── result_protoemds_final_stack.md
```

The assessment is designed for the IONOS-managed CaaS deployment and distinguishes it from any on-premise assessment. The currently pinned deployment baseline is branch `prepare-prod` at commit `846e5f1d7a388e664fe9e4942e553021752d63c6` of `deployEMDS-k8s-deployment`.

The expected public connector paths are:

| Capability | Path |
| --- | --- |
| DSP | `/api/dsp` |
| Management API | `/api/management/` |
| DID document | `/.well-known/did.json` |
| Connector UI | `/dashboard/` |

TLS and protocol authentication must be demonstrated by live evidence. Deployment manifests, Ingress annotations, and certificate configuration are supporting evidence only.
