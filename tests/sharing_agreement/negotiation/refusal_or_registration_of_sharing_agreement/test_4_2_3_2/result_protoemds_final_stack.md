## [4.2.3.2] Sharing agreement: Negotiation - Refusal or registration of sharing agreement

### Stack: protoEMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the protoEMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `protoemds_final_stack` |
| Stack under assessment | protoEMDS Final Stack (EDC-based) |
| KPI1 area | Observability / logging |
| Existing test ID | `4.2.3.2` |
| Level | Technical |
| ISO/IEC 25010 mapping | Reliability, Maintainability |
| Owner (tentative) | Carlos (i2CAT) |
| Reviewer | Carlos |
| Deployment model assessed | TBD |
| Target environment | TBD |
| EDC version / release | TBD |
| Connector deployment reference | TBD |
| Assessment evidence | TBD |

The assessment should be completed using the deployment model for which evidence is realistically available. It is not mandatory to execute the same test in both CaaS and on-premise environments.

If only one deployment model is assessed, the other one should be marked as `Not assessed`.

#### Tested quality metric and method

This result reuses the existing stack-agnostic test definition in `test.md` and adds an protoEMDS Final Stack integration-assessment perspective.

It does not replace the historical stack-specific result files, such as `result_edc_vc.md` or `result_fiware.md`.

The quality metric, expected output and comparative criteria remain those defined by the original test. This result file should only capture the evidence and assessment outcome for the selected protoEMDS Final Stack deployment.

#### Test-specific assessment scope

Check whether the system provides a observability trace of the sharing agreement (privacy terms of observability are out of scope here).

#### Expected Output

The expected outcome of the current test is to evaluate whether the system provides an observability trace of the sharing agreement (privacy terms of observability are out of scope).

### Results

#### Assessment

Pending.

The assessment should be completed once consolidated technical evidence is available for the protoEMDS Final Stack deployment.

The result should clearly indicate which deployment model was assessed. It is acceptable to assess only one deployment model if evidence for the other deployment model is not available.

#### Deployment model assessed

| Deployment model | Status | Evidence | Consolidated assessment |
| --- | --- | --- | --- |
| CaaS / IONOS-managed deployment | TBD | TBD | Complete this row only if evidence is collected from the IONOS-managed deployment. Otherwise mark as `Not assessed`. |
| On-premise deployment | TBD | TBD | Complete this row only if evidence is collected from an on-premise or locally managed deployment. Otherwise mark as `Not assessed`. |

#### Measured results

| Criteria | Measured KPI | Evidence | Notes |
| --- | ---: | --- | --- |
| No traceability. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| System logs, which record only a connection between two connectors using non-data space identifiers such as a public URL or IP address. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| Application logs that include process information, for example, "Connector control plane initiating on port...". | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| Data space protocol status traces, such as "Data sharing agreement request". | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| Data space protocol transaction traces, for instance, "Contract ID Op: negotiation". | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| A complete data space protocol context dump, including the entire JSON dump with references. | TBD | TBD | Pending protoEMDS Final Stack assessment. |

**Functional suitability quality metric:** TBD

#### Notes

This result introduces an **protoEMDS Final Stack** perspective for the existing test `4.2.3.2` under the KPI1 area **Observability / logging**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

This result file was generated from the local `test.md` and, where available, the local `result_edc_vc.md` structure. EDC+VC-specific evidence, values and scores were intentionally not reused.


