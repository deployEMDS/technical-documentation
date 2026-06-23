## [2.1.1.3] Data product publication: Provision - Data source endpoint provisioning

### Stack: EMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the EMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `emds_final_stack` |
| Stack under assessment | EMDS Final Stack (EDC-based) |
| KPI1 area | Connector and data planes |
| Existing test ID | `2.1.1.3` |
| Level | Technical |
| ISO/IEC 25010 mapping | Compatibility, Reliability |
| Owner (tentative) | Carlos (i2CAT) |
| Reviewer | Wilhelm |
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

Assess the availability of multiple data planes that support multiple protocols. Refer to D2.1 for an overview of the most used protocols. The higher the coverage, the higher the ranking.

#### Expected Output

Evaluate the level of support for the following data formats

- GTFS - [Public dataset](https://opendata-ajuntament.barcelona.cat/data/dataset/c46503e3-cec6-4032-894d-1063b7a365ee/resource/1c92542e-0346-4df5-9824-d7753ab02e33/download) with direct download via HTTPS
- GTFS-RT - [Public dataset](https://api.data.gov.my/gtfs-realtime/vehicle-position/ktmb/) via APIs
- DATEX-II - [Public dataset](https://opendata.emel.pt/cycling/biciparks?skip=1&limit=1) via APIs
- DATX II Light - No available datasets for this data format, tests are skipped
- GBFS - [Public dataset](https://opendata.emel.pt/cycling/biciparks?skip=1&limit=1) via APIs
- WMS/WFS - [Public dataset](https://openmaps.gov.bc.ca/geo/ows?SERVICE=WMS&REQUEST=GetCapabilities) via APIs

Also access through APIs.
Access to private APIs is tested using the AMB mobilitat endpoint.

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

| **Criterion** | **Description** | **Score (0-4)** | **Explanation** |
|------------------------------|-----------------------------------------------------------------------------------------------------|-----------------|-------------|
| **Functional Completeness** | TBD | TBD | TBD |
| **Functional Correctness** | TBD | TBD | TBD |
| **Functional Appropriateness** | TBD | TBD | TBD |

**Functional Suitability Quality Metric Score:** TBD

#### Notes

This result introduces an **EMDS Final Stack** perspective for the existing test `2.1.1.3` under the KPI1 area **Connector and data planes**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

This result file was generated from the local `test.md` and, where available, the local `result_edc_vc.md` structure. EDC+VC-specific evidence, values and scores were intentionally not reused.
