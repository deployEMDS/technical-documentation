## [5.2.1.1] Data sharing: Data sharing activities - Enforce usage control

### Stack: protoEMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the protoEMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `protoemds_final_stack` |
| Stack under assessment | protoEMDS Final Stack (EDC-based) |
| KPI1 area | Usage control enforcement |
| Existing test ID | `5.2.1.1` |
| Level | Technical |
| ISO/IEC 25010 mapping | Security, Maintainability |
| Owner (tentative) | Xavier (Eurocat) |
| Reviewer | Xavier |
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

Test the policies that are supported out of the box.  
For the policies that are not supported, describe the effort of how to build them, and rank the system consequently (e.g.: create a plugin in a documented environment ranks better than integrating an external function that introduces dependencies and interface maintenance).

#### Expected Output

Usage control is defined based on the IDSA Position Paper “[Data Usage Control in IDS](https://internationaldataspaces.org/data-sovereignty-updated-position-paper-on-data-usage-control-in-the-ids/)”. Usage control involves specifying and enforcing restrictions on what must (or must not) happen to data after access has been granted.

The test aims to evaluate which usage policies are supported out of the box. For those policies not natively supported, it should describe the effort needed to implement them and rank the system accordingly. For instance, creating a plugin within a documented environment is rated more favorably than integrating an external function that introduces dependencies and requires interface maintenance. The essential policies that need to be implemented are:

- **Allow-usage:** Always true or false.
- **Role-restricted:** Based on the role of the participant.
- **Location-restricted:** Based on the location of the consumer, typically "EU" or "Non-EU".

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

| Criteria | Measured KPI | Evidence | Notes |
| --- | ---: | --- | --- |
| No out of the box policies | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| No out of the box policies but policies are available from a library | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| Partial out-of-the-box-policies | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| Full set of out-of-the-box policies | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| Documented way to create/expand policies | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| Documented way to create/expand policies + templates for basic polices | TBD | TBD | Pending protoEMDS Final Stack assessment. |

**Functional Suitability Quality Metric:** TBD

#### Notes

This result introduces an **protoEMDS Final Stack** perspective for the existing test `5.2.1.1` under the KPI1 area **Usage control enforcement**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

This result file was generated from the local `test.md` and, where available, the local `result_edc_vc.md` structure. EDC+VC-specific evidence, values and scores were intentionally not reused.


