## [4.2.1.6] Sharing agreement: Negotiation - Negotiating sharing agreement

### Stack: protoEMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the protoEMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `protoemds_final_stack` |
| Stack under assessment | protoEMDS Final Stack (EDC-based) |
| KPI1 area | Security and restricted access |
| Existing test ID | `4.2.1.6` |
| Level | Technical |
| ISO/IEC 25010 mapping | Security |
| Owner (tentative) | Carlos (i2Cat) / Wilhelm (Fraunhofer IVI) |
| Reviewer | Casper (imec)  |
| Deployment model assessed | CaaS / IONOS-managed deployment |
| Target environment | Ionos DCD `EMDS-PROD` |
| EDC version / release | emds-edc-connector `9916cc56b682ae70988300d301b752ca8eb05121` <br> based on eclipse edc connector `0.10.0` |
| Connector deployment reference | `deployEMDS-k8s-deployment`, branch `prepare-prod`, commit `846e5f1d7a388e664fe9e4942e553021752d63c6` |
| Assessment evidence | [`resources-protoemds_final_stack/evidence-manifest.md`](./resources-protoemds_final_stack/evidence-manifest.md), including [`DSP-01`](./resources-protoemds_final_stack/dsp-01-approved-minimal-negotiation.md) |

The assessment should be completed using the deployment model for which evidence is realistically available. It is not mandatory to execute the same test in both CaaS and on-premise environments.

If only one deployment model is assessed, the other one should be marked as `Not assessed`.

#### Tested quality metric and method

This result reuses the existing stack-agnostic test definition in `test.md` and adds an protoEMDS Final Stack integration-assessment perspective.

It does not replace the historical stack-specific result files, such as `result_edc_vc.md` or `result_fiware.md`.

The quality metric, expected output and comparative criteria remain those defined by the original test. This result file should only capture the evidence and assessment outcome for the selected protoEMDS Final Stack deployment.

The reproducible execution procedure is in [`code-protoemds_final_stack/README.md`](./code-protoemds_final_stack/README.md) and [`resources-protoemds_final_stack/evidence-manifest.md`](./resources-protoemds_final_stack/evidence-manifest.md).

#### Test-specific assessment scope

Validate that the data sharing protocol is compatible with channel encryption (e.g. TLS), that a connector authentication has taken place exclusively for the data sharing negotiation.

#### Expected Output

The test aims to assess whether the data sharing protocol is compatible with channel encryption (e.g., TLS) and whether connector authentication has occurred solely for the purpose of data sharing negotiation.

### Results

#### Assessment

The CaaS / IONOS-managed deployment was assessed using two ready EDC connectors. Both public DSP endpoints advertise HTTPS through their DID documents, validate with trusted TLS 1.3 certificates, and redirect plaintext HTTP to HTTPS.

The running control planes were verified to receive the expected DSP callback, `did:web` identity, STS, and trace-exporter settings. A single approved negotiation reused the provider's existing `asset1` offer, associated with existing `policy1` and `contract3`, without changing any asset, policy, contract definition, participant, credential, or data-transfer state.

The negotiation initiated by `connector-b` against `connector-a` reached `FINALIZED` on both connectors. The consumer and provider records share agreement `f48bd1f2-8c0c-4e0d-a9f1-890bf2c4ad48`, and filtered control-plane logs show the DSP agreement, verification, and finalization exchange. See [`DSP-01`](./resources-protoemds_final_stack/dsp-01-approved-minimal-negotiation.md).

The collected evidence demonstrates encrypted DSP transport and a successful connector-to-connector agreement exchange. The proposed assessment is Full Coverage because the authenticated connector workflow finalized on both sides over the validated HTTPS DSP path. The captured logs do not provide a standalone authentication-event record that attributes peer authentication to a specific credential or verification decision; Casper should confirm this interpretation or change the score to Significant Coverage during review.

#### Deployment model assessed

| Deployment model | Status | Evidence | Consolidated assessment |
| --- | --- | --- | --- |
| CaaS / IONOS-managed deployment | Assessed | [`ENV-01`](./resources-protoemds_final_stack/env-01-live-cluster-inventory.md), [`AUTH-01`](./resources-protoemds_final_stack/auth-01-live-authentication-configuration.md), [`AUTH-02`](./resources-protoemds_final_stack/auth-02-kubernetes-runtime-configuration-binding.md), [`TLS-01`](./resources-protoemds_final_stack/tls-01-connector-a-did-and-certificate.md), [`TLS-02`](./resources-protoemds_final_stack/tls-02-connector-b-did-and-certificate.md), [`DSP-01`](./resources-protoemds_final_stack/dsp-01-approved-minimal-negotiation.md) | TLS, runtime configuration, and a minimal existing-offer negotiation were assessed. |
| On-premise deployment | Not assessed | N/A | No on-premise evidence was collected. |

#### Measured results

| **Criteria** | Measured KPI | Evidence | Notes |
| --- | ---: | --- | --- |
| **No Coverage:** The solution fails to meet any of the specified technical requirements. It is not compatible with essential security protocols such as channel encryption (e.g., TLS), and no connector authentication has been implemented for data-sharing negotiations. The solution is completely inadequate for secure and effective operation. | Not selected | [`TLS-01`](./resources-protoemds_final_stack/tls-01-connector-a-did-and-certificate.md), [`TLS-02`](./resources-protoemds_final_stack/tls-02-connector-b-did-and-certificate.md) | Valid TLS was demonstrated for both DSP endpoints. |
| **Minimal Coverage:** The solution meets up to 25% of the technical requirements. It offers very basic functionality, with significant limitations. Some minimal security measures might be in place, but critical features like connector authentication or comprehensive encryption are largely absent or inadequately implemented. | Not selected | [`AUTH-01`](./resources-protoemds_final_stack/auth-01-live-authentication-configuration.md), [`AUTH-02`](./resources-protoemds_final_stack/auth-02-kubernetes-runtime-configuration-binding.md) | Runtime identity and authentication architecture evidence exceeds basic configuration-only coverage. |
| **Partial Coverage:** The solution satisfies approximately 50% of the technical requirements. While it includes some important features and may partially support security protocols and authentication processes, there are still substantial gaps that limit its overall effectiveness and reliability. | Not selected | [`DSP-01`](./resources-protoemds_final_stack/dsp-01-approved-minimal-negotiation.md) | A completed encrypted DSP agreement exchange exceeds partial coverage. |
| **Significant Coverage:** The solution covers about 80% of the technical requirements. It demonstrates a strong alignment with the desired technical criteria, including robust support for channel encryption and authentication mechanisms, though there may be minor areas where further improvement is needed. | Not selected | [`AUTH-01`](./resources-protoemds_final_stack/auth-01-live-authentication-configuration.md), [`AUTH-02`](./resources-protoemds_final_stack/auth-02-kubernetes-runtime-configuration-binding.md), [`TLS-01`](./resources-protoemds_final_stack/tls-01-connector-a-did-and-certificate.md), [`TLS-02`](./resources-protoemds_final_stack/tls-02-connector-b-did-and-certificate.md), [`TLS-03`](./resources-protoemds_final_stack/evidence-manifest.md), [`DSP-01`](./resources-protoemds_final_stack/dsp-01-approved-minimal-negotiation.md) | The same evidence supports Full Coverage as the proposed reviewer interpretation. |
| **Full Coverage:** The solution fully meets all specified technical requirements. It provides comprehensive support for all key features, including complete compatibility with channel encryption protocols (e.g., TLS) and effective connector authentication for secure data-sharing negotiations. There are no significant gaps, making the solution highly suitable for deployment. | 4 (proposed, pending reviewer confirmation) | [`AUTH-01`](./resources-protoemds_final_stack/auth-01-live-authentication-configuration.md), [`AUTH-02`](./resources-protoemds_final_stack/auth-02-kubernetes-runtime-configuration-binding.md), [`TLS-01`](./resources-protoemds_final_stack/tls-01-connector-a-did-and-certificate.md), [`TLS-02`](./resources-protoemds_final_stack/tls-02-connector-b-did-and-certificate.md), [`TLS-03`](./resources-protoemds_final_stack/evidence-manifest.md), [`DSP-01`](./resources-protoemds_final_stack/dsp-01-approved-minimal-negotiation.md) | Proposed for Casper's review: both connectors finalized the same agreement over the validated HTTPS DSP path. No standalone authentication-event record was captured. |

**Functional Suitability Quality Metric: 4**

#### Notes

This result introduces an **protoEMDS Final Stack** perspective for the existing test `4.2.1.6` under the KPI1 area **Security and restricted access**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment is supported by consolidated technical evidence, including endpoint responses, runtime configuration inspection, management API responses, and filtered connector logs.

This result file was generated from the local `test.md` and, where available, the local `result_edc_vc.md` structure. EDC+VC-specific evidence, values and scores were intentionally not reused.

The test-local runbook and evidence manifest are versioned with this result to enable replication without exposing credentials, cluster configuration, raw logs or other sensitive operational information.
