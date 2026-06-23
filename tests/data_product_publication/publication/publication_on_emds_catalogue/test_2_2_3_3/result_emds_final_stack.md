## [2.2.3.3] Data product publication: Publication - Publication on EMDS catalogue

### Stack: EMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the EMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `emds_final_stack` |
| Stack under assessment | EMDS Final Stack (EDC-based) |
| KPI1 area | Catalogue publication |
| Existing test ID | `2.2.3.3` |
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

This result reuses the existing stack-agnostic test definition in `test.md` and adds an EMDS Final Stack integration-assessment perspective.

It does not replace the historical stack-specific result files, such as `result_edc_vc.md` or `result_fiware.md`.

The quality metric, expected output and comparative criteria remain those defined by the original test. This result file should only capture the evidence and assessment outcome for the selected EMDS Final Stack deployment.

#### Test-specific assessment scope

Assess that a GUI for the functionality to publish a data product offering into the catalogue and discovery tools is available.

#### Expected Output

The test aims to verify the availability of a GUI for publishing a data product offering into the catalog and discovery tools.

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

| Criteria | Measured KPI | Evidence | Notes |
| --- | ---: | --- | --- |
| **No Coverage:** No technical requirements are met. The solution does not have a GUI tool for publishing a data product offering into the catalogue and enabling discovery. The system does not provide any GUI means for users to interact with or manage data product offerings. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Minimal Coverage:** Up to 25% of the technical requirements are met. The solution provides limited functionality, such as a basic GUI tool with minimal features, allowing for partial publication of data products but lacks robust discovery options. User interface might be clunky, and only a few essential functions are available. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Partial Coverage:** Approximately 50% of the technical requirements are met. The solution includes a GUI tool that allows for the publication of data products and some discovery features. However, it lacks advanced functionality, such as customizable search options, detailed metadata management, or integration with other systems. Usability and user experience are moderately acceptable. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Significant Coverage:** About 80% of the technical requirements are met. The solution offers a comprehensive GUI tool with most required features, such as advanced publication workflows, robust discovery capabilities, customizable search filters, and metadata management. Integration with other systems and platforms is partially supported, and the user experience is generally smooth. However, some advanced features or full system integration might still be lacking. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Full Coverage:** All technical requirements are fully met. The solution includes a fully featured GUI tool for publishing data product offerings into the catalogue, complete with advanced discovery features, customizable search options, detailed metadata management, and full integration with other systems. The user interface is intuitive and user-friendly, providing an excellent user experience. | TBD | TBD | Pending EMDS Final Stack assessment. |

**Functional Suitability Quality Metric:** TBD

#### Notes

This result introduces an **EMDS Final Stack** perspective for the existing test `2.2.3.3` under the KPI1 area **Catalogue publication**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

This result file was generated from the local `test.md` and, where available, the local `result_edc_vc.md` structure. EDC+VC-specific evidence, values and scores were intentionally not reused.
