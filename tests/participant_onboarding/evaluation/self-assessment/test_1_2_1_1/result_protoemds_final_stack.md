## [1.2.1.1] Participant onboarding: Evaluation - Self-assessment

### Stack: protoEMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the protoEMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `protoemds_final_stack` |
| Stack under assessment | protoEMDS Final Stack (EDC-based) |
| KPI1 area | Participant onboarding / identity |
| Existing test ID | `1.2.1.1` |
| Level | UC + Technical |
| ISO/IEC 25010 mapping | Functional suitability, Security |
| Owner (tentative) | Alessio (Cefriel) / Delia M. (NTT DATA) |
| Reviewer | Alessio |
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

If an onboarding online facility is provided, evaluate the level of customisation required to input participants’ metadata.

#### Expected Output

**The expected output of this test is to evaluate the level of customization required to input participants' metadata if an onboarding online facility is provided.**

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

| **Criterion** | **Description** | **Score (0-4)** | **Explanation** |
|------------------------------|------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Functional Completeness** | TBD | TBD | TBD |
| **Functional Correctness** | TBD | TBD | TBD |
| **Functional Appropriateness** | TBD | TBD | TBD |

**For more details, refer to the [IdentityHub API documentation](https:** TBD
**Overall Calculation:** TBD
**Functional Suitability Quality Metric Score:** TBD

#### Notes

This result introduces an **protoEMDS Final Stack** perspective for the existing test `1.2.1.1` under the KPI1 area **Participant onboarding / identity**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

This result file was generated from the local `test.md` and, where available, the local `result_edc_vc.md` structure. EDC+VC-specific evidence, values and scores were intentionally not reused.


