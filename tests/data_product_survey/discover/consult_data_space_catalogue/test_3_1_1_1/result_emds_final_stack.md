## [3.1.1.1] Data product survey: Discover - Consult data space catalogue

### Stack: EMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the EMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `emds_final_stack` |
| Stack under assessment | EMDS Final Stack (EDC-based) |
| KPI1 area | Catalogue discovery / metadata |
| Existing test ID | `3.1.1.1` |
| Level | UC + Technical |
| ISO/IEC 25010 mapping | Functional suitability, Compatibility |
| Owner (tentative) | Alessio (Cefriel) / Wilhelm |
| Reviewer | Carlos |
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

Assessment: If an Online U/X is natively available, evaluate individual search features. If the Data space catalogue exposes an API, assess the technical debt to integrate it with a data search tool that is representative for EU projects. Criteria are: Open Source, hosted solution or EU-driven project.

#### Expected Output

The test aims to determine whether a native online user experience (U/X) is available and evaluate individual search features. 
If the data space catalog exposes an API, the test assesses the technical effort required to integrate it with a data search tool representative of EU projects.
The criteria for evaluation include being open-source, a hosted solution, or part of an EU-driven project.

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

| **Criteria** | Measured KPI | Evidence | Notes |
| --- | ---: | --- | --- |
| **No Coverage:** The solution fails to provide a native online user experience (U/X), exposes no search features, and does not offer any integration with open-source solutions, hosted solutions, or EU-driven projects. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Minimal Coverage:** The solution meets up to 25% of the evaluation criteria. This might include a basic online user interface with limited functionality, minimal search features, or an API that is available but requires significant technical effort to integrate with any of the three types of solutions: open-source, hosted, or EU-driven projects. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Partial Coverage:** The solution satisfies approximately 50% of the evaluation criteria. This could involve a functional online user experience with some search features and an API that supports integration with at least one of the three types of solutions (open-source, hosted, or EU-driven projects) but requires moderate effort. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Significant Coverage:** The solution covers about 80% of the evaluation criteria. This includes a well-developed online user experience with comprehensive search features, and an API that is well-documented and supports integration with two of the three types of solutions with minimal technical effort. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Full Coverage:** The solution fully meets all evaluation criteria. This includes a fully developed native online user experience with advanced search features, and an API that seamlessly integrates with all three types of solutions (open-source, hosted, and EU-driven projects) with minimal or no technical effort. | TBD | TBD | Pending EMDS Final Stack assessment. |

**Functional Suitability Quality Metric:** TBD

#### Notes

This result introduces an **EMDS Final Stack** perspective for the existing test `3.1.1.1` under the KPI1 area **Catalogue discovery / metadata**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

This result file was generated from the local `test.md` and, where available, the local `result_edc_vc.md` structure. EDC+VC-specific evidence, values and scores were intentionally not reused.
