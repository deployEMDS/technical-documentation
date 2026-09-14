## [2.2.3.1A] Data product publication: Publication - Publication on EMDS catalogue

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
| Existing test ID | `2.2.3.1A` |
| Level | UC + Technical |
| ISO/IEC 25010 mapping | Functional suitability, Compatibility |
| Owner | Casper (imec, @vghelu49) |
| Reviewer | Alessio |
| Deployment model assessed | CaaS / IONOS-managed deployment |
| Target environment | IONOS-managed CaaS deployment |
| EDC version / release | `emds-edc-connector` `9916cc5`, based on Eclipse EDC `0.10.0` |
| Connector deployment reference | `deployEMDS-k8s-deployment`, branch `prepare-prod`, commit `846e5f1` |
| Assessment evidence | Bruno CLI API execution and authenticated Playwright UI verification; all reported evidence is sanitized |

The assessment should be completed using the deployment model for which evidence is realistically available. It is not mandatory to execute the same test in both CaaS and on-premise environments.

The deployment models are assessed independently. The CaaS assessment is
complete; the on-premise assessment remains `TBD`.

#### Tested quality metric and method

This result reuses the existing stack-agnostic test definition in `test.md` and adds a protoEMDS Final Stack integration-assessment perspective.

It does not replace the historical stack-specific result files, such as `result_edc_vc.md` or `result_fiware.md`.

The quality metric, expected output and comparative criteria remain those defined by the original test. This result file should only capture the evidence and assessment outcome for the selected protoEMDS Final Stack deployment.

#### Test-specific assessment scope

Test the process of catalogue publication for a data product under the following conditions: a new data product is published in the catalogue

#### Expected Output

The test aims to examine the process of catalog publication for a data product under the following conditions: a new data product is added to the catalog. The EMDS catalog, as defined in the relevant documentation,
refers to the Data Space-only catalog, specifically the internal EDC catalog and its federation component.

### Results

#### Assessment

Pass for the tested provider-to-consumer publication path.

The run created a new asset, policy, and contract definition, then retrieved
the new dataset from the consumer catalogue with `200 OK`. The returned
dataset ID, metadata, distributions, and DSP endpoint were present and
consistent with the test fixture.

#### Deployment model assessed

| Deployment model | Status | Evidence | Consolidated assessment |
| --- | --- | --- | --- |
| CaaS / IONOS-managed deployment | Pass | Sanitized Bruno CLI run record | New test product was visible from the consumer catalogue. |
| On-premise deployment | TBD | TBD | To be assessed separately. |

#### Measured results

| Criteria | Measured KPI | Evidence | Notes |
| --- | ---: | --- | --- |
| **No Coverage:** No technical requirements are met. The solution fails to provide any functionality for the new data product in the catalog. | Not selected | API and UI execution | Publication succeeded. |
| **Minimal Coverage:** Up to 25% of the technical requirements are met. Only basic functionalities are implemented, leaving most requirements unaddressed. | Not selected | API and UI execution | Publication succeeded without the limitations described by this level. |
| **Partial Coverage:** Approximately 50% of the technical requirements are met. Key functions are partially implemented, but several critical aspects are lacking. | Not selected | API and UI execution | The complete test path succeeded. |
| **Significant Coverage:** About 80% of the technical requirements are met. Most functionalities work as expected, with only minor gaps needing improvement. | Not selected | API and UI execution | No gap was observed in the scope of this test. |
| **Full Coverage:** All technical requirements are fully met. The solution provides a comprehensive, out-of-the-box solution for the new data product in the catalog. | **4** | API and UI execution | Asset, policy, and contract creation returned `200 OK`; the consumer catalogue returned the new product with the expected metadata and distributions. |

**Functional Suitability Quality Metric:** 4

The score is 4 because this run covered the complete publication path required
by the test: creating the product resources and confirming that the resulting
product was visible in the consumer catalogue. It does not imply that the
separate de-publication, UI, or federation tests have passed.

#### Notes

This result introduces a **protoEMDS Final Stack** perspective for the existing test `2.2.3.1A` under the KPI1 area **Catalogue publication**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The score applies to the assessed CaaS deployment. The on-premise result
remains TBD for a separate assessment.
