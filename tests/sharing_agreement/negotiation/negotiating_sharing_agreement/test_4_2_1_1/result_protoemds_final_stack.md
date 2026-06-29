## [4.2.1.1] Sharing agreement: Negotiation - Negotiating sharing agreement

### Stack: protoEMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the protoEMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `protoemds_final_stack` |
| Stack under assessment | protoEMDS Final Stack (EDC-based) |
| KPI1 area | Sharing agreement |
| Existing test ID | `4.2.1.1` |
| Level | Technical |
| ISO/IEC 25010 mapping | Functional suitability, Compatibility, Security |
| Owner (tentative) | Xavier (Eurocat) |
| Reviewer | TBD |
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

Test completeness: Two connectors can negotiate a data sharing agreement that supports a defined minimal state machine (the definition of the minimal state machine must be agreed beforehand).

#### Expected Output

The test aims to assess the state machine implementation of the EDC ecosystem regarding the sharing negotiation.

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

| **Criteria** | Measured KPI | Evidence | Notes |
| --- | ---: | --- | --- |
| **No Coverage:** The solution fails to implement any negotiation flow for the data sharing agreement based on the defined minimal state machine. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Minimal Coverage:** The solution meets up to 25% of the technical requirements. This might include only a basic framework for the negotiation flow, with a significant part of the defined minimal state machine not implemented. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Partial Coverage:** The solution satisfies approximately 50% of the technical requirements. This could involve a partially implemented negotiation flow for the data sharing agreement based on the defined minimal state machine, with several key elements missing or incomplete. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Significant Coverage:** The solution covers about 80% of the technical requirements. This includes a well-implemented negotiation flow for the data sharing agreement based on the defined minimal state machine, with only minor elements or details that may still need refinement. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Full Coverage:** The solution fully meets all technical requirements. This includes a fully implemented negotiation flow for the data sharing agreement based on the defined minimal state machine, with all elements thoroughly addressed and tested. | TBD | TBD | Pending protoEMDS Final Stack assessment. |

**Functional suitability quality metric:** TBD

#### Notes

This result introduces an **protoEMDS Final Stack** perspective for the existing test `4.2.1.1` under the KPI1 area **Sharing agreement**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

This result file was generated from the local `test.md` and, where available, the local `result_edc_vc.md` structure. EDC+VC-specific evidence, values and scores were intentionally not reused.


