## [2.2.2.1] Data product publication: Publication - Deploy/config usage control functions

### Stack: EMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the EMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `emds_final_stack` |
| Stack under assessment | EMDS Final Stack (EDC-based) |
| KPI1 area | Policy management |
| Existing test ID | `2.2.2.1` |
| Level | Technical |
| ISO/IEC 25010 mapping | Security, Maintainability |
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

This result reuses the existing stack-agnostic test definition in `test.md` and adds an EMDS Final Stack integration-assessment perspective.

It does not replace the historical stack-specific result files, such as `result_edc_vc.md` or `result_fiware.md`.

The quality metric, expected output and comparative criteria remain those defined by the original test. This result file should only capture the evidence and assessment outcome for the selected EMDS Final Stack deployment.

#### Test-specific assessment scope

Assess the completeness of the administrative interface (either API or GUI) so that it covers the most needed use cases for the deployment of usage policies: upload a new policy, (optional) bind a policy with a custom enforcement function, assign a policy to a sharing agreement, delete a policy, re-use an uploaded policy, persist uploaded policies.

#### Expected Output

See `test.md` for the complete expected output and comparative criteria for this test.

### Results

#### Assessment

Pending.

The assessment should be completed once consolidated technical evidence is available for the EMDS Final Stack deployment.

The result should clearly indicate which deployment model was assessed. It is acceptable to assess only one deployment model if evidence for the other deployment model is not available.

#### Deployment model assessed

| Deployment model | Status | Evidence | Consolidated assessment |
| --- | --- | --- | --- |
| CaaS / IONOS-managed deployment | TBD | TBD | Complete this row only if evidence is collected from the IONOS-managed deployment. Otherwise mark as `Not assessed`. |
| On-premise deployment | TBD | TBD | Complete this row only if evidence is collected from an on-premise or locally managed deployment. Otherwise mark as `Not assessed`. |

#### Measured results

| **Assessment** | **Functional Completeness** | **Functional Correctness** | **Functional Appropriateness** | **Explanation** |
|-----------------------------|-----------------------------|----------------------------|---------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Upload a new policy | TBD | TBD | TBD | TBD |
| Re-use an uploaded policy | TBD | TBD | TBD | TBD |
| Persist uploaded policies | TBD | TBD | TBD | TBD |
| Delete a policy | TBD | TBD | TBD | TBD |
| **Overall** | TBD | TBD | TBD | TBD |

**Functional Suitability Quality Metric Score:** TBD

#### Notes

This result introduces an **EMDS Final Stack** perspective for the existing test `2.2.2.1` under the KPI1 area **Policy management**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

This result file was generated from the local `test.md` and, where available, the local `result_edc_vc.md` structure. EDC+VC-specific evidence, values and scores were intentionally not reused.
