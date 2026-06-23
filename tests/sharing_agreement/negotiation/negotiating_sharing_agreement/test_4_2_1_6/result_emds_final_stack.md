## [4.2.1.6] Sharing agreement: Negotiation - Negotiating sharing agreement

### Stack: EMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the EMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `emds_final_stack` |
| Stack under assessment | EMDS Final Stack (EDC-based) |
| KPI1 area | Security and restricted access |
| Existing test ID | `4.2.1.6` |
| Level | Technical |
| ISO/IEC 25010 mapping | Security |
| Owner (tentative) | Casper (imec) |
| Reviewer | Casper |
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

Validate that the data sharing protocol is compatible with channel encryption (e.g. TLS), that a connector authentication has taken place exclusively for the data sharing negotiation.

#### Expected Output

The test aims to assess whether the data sharing protocol is compatible with channel encryption (e.g., TLS) and whether connector authentication has occurred solely for the purpose of data sharing negotiation.

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
| **No Coverage:** The solution fails to meet any of the specified technical requirements. It is not compatible with essential security protocols such as channel encryption (e.g., TLS), and no connector authentication has been implemented for data-sharing negotiations. The solution is completely inadequate for secure and effective operation. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Minimal Coverage:** The solution meets up to 25% of the technical requirements. It offers very basic functionality, with significant limitations. Some minimal security measures might be in place, but critical features like connector authentication or comprehensive encryption are largely absent or inadequately implemented. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Partial Coverage:** The solution satisfies approximately 50% of the technical requirements. While it includes some important features and may partially support security protocols and authentication processes, there are still substantial gaps that limit its overall effectiveness and reliability. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Significant Coverage:** The solution covers about 80% of the technical requirements. It demonstrates a strong alignment with the desired technical criteria, including robust support for channel encryption and authentication mechanisms, though there may be minor areas where further improvement is needed. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Full Coverage:** The solution fully meets all specified technical requirements. It provides comprehensive support for all key features, including complete compatibility with channel encryption protocols (e.g., TLS) and effective connector authentication for secure data-sharing negotiations. There are no significant gaps, making the solution highly suitable for deployment. | TBD | TBD | Pending EMDS Final Stack assessment. |

**Functional Suitability Quality Metric:** TBD

#### Notes

This result introduces an **EMDS Final Stack** perspective for the existing test `4.2.1.6` under the KPI1 area **Security and restricted access**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

This result file was generated from the local `test.md` and, where available, the local `result_edc_vc.md` structure. EDC+VC-specific evidence, values and scores were intentionally not reused.
