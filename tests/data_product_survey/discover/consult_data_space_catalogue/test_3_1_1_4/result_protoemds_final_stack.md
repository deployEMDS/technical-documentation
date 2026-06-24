## [3.1.1.4] Data product survey: Discover - Consult data space catalogue

### Stack: protoEMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the protoEMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `protoemds_final_stack` |
| Stack under assessment | protoEMDS Final Stack (EDC-based) |
| KPI1 area | Catalogue discovery / metadata |
| Existing test ID | `3.1.1.4` |
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

This result reuses the existing stack-agnostic test definition in `test.md` and adds an protoEMDS Final Stack integration-assessment perspective.

It does not replace the historical stack-specific result files, such as `result_edc_vc.md` or `result_fiware.md`.

The quality metric, expected output and comparative criteria remain those defined by the original test. This result file should only capture the evidence and assessment outcome for the selected protoEMDS Final Stack deployment.

#### Test-specific assessment scope

Assessment: either the data product specification provides the necessary metadata to report quality, or the catalogue must be extended with an “-AP” profile. Ranks higher in the first case.

#### Expected Output

The test aims to determine whether the data product specification provides the necessary metadata for quality reporting or if the catalog needs to be extended with an "-AP" profile, with the former being ranked higher. The system may offer varying levels of support for Napcore's DCAT-AP profile, such as [MobilityDCAT-AP](https://mobilitydcat-ap.github.io/mobilityDCAT-AP/releases/index.html) profiles. The evaluation focuses on the level of support for the Napcore Profile and its vocabulary.

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
| **No DCAT-AP Support:** The implementation does not allow any DCAT-AP profile or functionality. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Breaks with Napcore DCAT-AP:** The implementation breaks if Napcore's DCAT-AP is used to describe data products. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Ignores Extensions but Functional:** The implementation ignores the extensions of Napcore's DCAT-AP, but the system works as expected, with extended metadata retrievable as part of the distribution. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Partial Integration:** The implementation integrates Napcore's DCAT-AP profile and utilizes it for some search and listing functionalities, but with limitations. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Full Integration:** The implementation fully integrates Napcore's DCAT-AP profile and utilizes it effectively for search and listing functionalities. | TBD | TBD | Pending protoEMDS Final Stack assessment. |

**Functional Suitability Quality Metric:** TBD

#### Notes

This result introduces an **protoEMDS Final Stack** perspective for the existing test `3.1.1.4` under the KPI1 area **Catalogue discovery / metadata**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

This result file was generated from the local `test.md` and, where available, the local `result_edc_vc.md` structure. EDC+VC-specific evidence, values and scores were intentionally not reused.


