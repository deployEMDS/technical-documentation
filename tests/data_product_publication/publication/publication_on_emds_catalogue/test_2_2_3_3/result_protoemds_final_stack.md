## [2.2.3.3] Data product publication: Publication - Publication on EMDS catalogue

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
| Existing test ID | `2.2.3.3` |
| Level | UC + Technical |
| ISO/IEC 25010 mapping | Functional suitability, Compatibility |
| Owner | Casper (imec, @vghelu49) |
| Reviewer | Alessio |
| Deployment model assessed | CaaS / IONOS-managed deployment |
| Target environment | IONOS-managed CaaS deployment |
| EDC version / release | `emds-edc-connector` `9916cc5`, based on Eclipse EDC `0.10.0` |
| Connector deployment reference | `deployEMDS-k8s-deployment`, branch `prepare-prod`, commit `846e5f1` |
| Assessment evidence | Authenticated Playwright UI verification and Bruno CLI API execution; all reported evidence is sanitized |

The assessment should be completed using the deployment model for which evidence is realistically available. It is not mandatory to execute the same test in both CaaS and on-premise environments.

The deployment models are assessed independently. The CaaS assessment is
complete; the on-premise assessment remains `TBD`.

#### Tested quality metric and method

This result reuses the existing stack-agnostic test definition in `test.md` and adds a protoEMDS Final Stack integration-assessment perspective.

It does not replace the historical stack-specific result files, such as `result_edc_vc.md` or `result_fiware.md`.

The quality metric, expected output and comparative criteria remain those defined by the original test. This result file should only capture the evidence and assessment outcome for the selected protoEMDS Final Stack deployment.

#### Test-specific assessment scope

Assess that a GUI for the functionality to publish a data product offering into the catalogue and discovery tools is available.

#### Expected Output

The test aims to verify the availability of a GUI for publishing a data product offering into the catalog and discovery tools.

### Results

#### Assessment

The deployed connector includes an authenticated GUI for managing the complete
set of resources needed to publish a data-product offering. The UI exposes:

- an asset list, search box, and asset-creation form;
- core metadata, MobilityDCAT-AP, ODPS pricing, sample, and data-address tabs;
- policy creation with permission, prohibition, and obligation rules;
- contract-definition creation linking policies and one or more assets;
- a catalogue browser that queries a counterparty by DSP address and DID and
  displays the resulting product and policy details.

After the connector password was supplied through the UI, the Management API
requests returned `200 OK`, and the product created through the API flow was
visible in the asset list and catalogue browser. The assessed catalogue browser
does not provide free-text search, metadata filters, or pagination controls.

![Sanitized asset publication form](images/publication-form-protoemds-final-stack.png)

#### Deployment model assessed

| Deployment model | Status | Evidence | Consolidated assessment |
| --- | --- | --- | --- |
| CaaS / IONOS-managed deployment | Assessed | Playwright UI and Bruno CLI | GUI supports asset, policy, and contract-definition workflows plus basic catalogue browsing. |
| On-premise deployment | TBD | TBD | To be assessed separately. |

#### Measured results

| Criteria | Measured KPI | Evidence | Notes |
| --- | ---: | --- | --- |
| **No Coverage:** No technical requirements are met. The solution does not have a GUI tool for publishing a data product offering into the catalogue and enabling discovery. The system does not provide any GUI means for users to interact with or manage data product offerings. | Not selected | UI inspection | A native connector GUI is deployed. |
| **Minimal Coverage:** Up to 25% of the technical requirements are met. The solution provides limited functionality, such as a basic GUI tool with minimal features, allowing for partial publication of data products but lacks robust discovery options. User interface might be clunky, and only a few essential functions are available. | Not selected | UI inspection | The GUI covers all three publication resources and basic discovery. |
| **Partial Coverage:** Approximately 50% of the technical requirements are met. The solution includes a GUI tool that allows for the publication of data products and some discovery features. However, it lacks advanced functionality, such as customizable search options, detailed metadata management, or integration with other systems. Usability and user experience are moderately acceptable. | **2** | UI and API execution | Publication forms and detailed metadata management are available, and catalogue browsing works. Advanced discovery filters, pagination, and external integrations were not demonstrated. |
| **Significant Coverage:** About 80% of the technical requirements are met. The solution offers a comprehensive GUI tool with most required features, such as advanced publication workflows, robust discovery capabilities, customizable search filters, and metadata management. Integration with other systems and platforms is partially supported, and the user experience is generally smooth. However, some advanced features or full system integration might still be lacking. | Not selected | UI inspection | Robust discovery and customizable search filters are absent. |
| **Full Coverage:** All technical requirements are fully met. The solution includes a fully featured GUI tool for publishing data product offerings into the catalogue, complete with advanced discovery features, customizable search options, detailed metadata management, and full integration with other systems. The user interface is intuitive and user-friendly, providing an excellent user experience. | Not selected | UI inspection | Advanced discovery and full external integration were not demonstrated. |

**Functional Suitability Quality Metric:** 2

The score is 2 because the native GUI implements the publication workflow and
basic catalogue discovery, matching the Partial Coverage criterion. It does
not reach score 3 because the discovery view lacks free-text search,
customizable metadata filters, and pagination, and no external-system
integration was demonstrated.

#### Notes

This result introduces a **protoEMDS Final Stack** perspective for the existing test `2.2.3.3` under the KPI1 area **Catalogue publication**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The score applies to the assessed CaaS deployment. The on-premise result
remains TBD for a separate assessment.
