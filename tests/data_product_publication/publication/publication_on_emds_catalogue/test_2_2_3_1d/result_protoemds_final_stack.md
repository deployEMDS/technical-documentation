## [2.2.3.1D] Data product publication: Publication - Publication on EMDS catalogue

### Stack: protoEMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the protoEMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `protoemds_final_stack` |
| Stack under assessment | protoEMDS Final Stack (EDC-based) |
| KPI1 area | Catalogue publication |
| Existing test ID | `2.2.3.1D` |
| Level | UC + Technical |
| ISO/IEC 25010 mapping | Functional suitability, Compatibility |
| Owner (tentative) | Alessio (Cefriel) / Wilhelm |
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

Test the process of catalogue publication for a data product under the following conditions: a data product is de-published.

#### Expected Output

The test aims to examine the process of catalog de-publication for a data product under the following conditions: a data product is removed (de-published) from the catalog. The EMDS catalog, as defined in the relevant documentation, refers to the Data Space-only catalog, specifically the internal EDC catalog and its federation component.

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
| **No Coverage:** The solution does not provide any functionality for de-publishing a data product from the catalog. Users cannot remove or hide a data product once it is published, and achieving this requires extensive custom development or workarounds. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Minimal Coverage:** The solution meets up to 25% of the evaluation criteria. It may offer basic de-publication functionality, but this is not fully operational out of the box and requires significant technical effort or development to implement. The process is cumbersome and not intuitive for end users. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Partial Coverage:** The solution satisfies approximately 50% of the evaluation criteria. It allows for de-publishing of data products but requires some degree of customization or development to function correctly. Additionally, the process may be partially intuitive but could still pose challenges for end users in terms of usability. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Significant Coverage:** The solution covers about 80% of the evaluation criteria. It provides effective de-publication functionality with minimal development required. The de-publication process is mostly intuitive and user-friendly, with only minor usability issues or adjustments needed. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Full Coverage:** The solution fully meets all evaluation criteria. It offers complete, out-of-the-box functionality for de-publishing a data product, allowing users to easily remove or hide a data product from the catalog. The process is straightforward, intuitive, and requires no additional development or technical modifications. | TBD | TBD | Pending protoEMDS Final Stack assessment. |

**Functional Suitability Quality Metric:** TBD

#### Notes

This result introduces an **protoEMDS Final Stack** perspective for the existing test `2.2.3.1D` under the KPI1 area **Catalogue publication**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

This result file was generated from the local `test.md` and, where available, the local `result_edc_vc.md` structure. EDC+VC-specific evidence, values and scores were intentionally not reused.


