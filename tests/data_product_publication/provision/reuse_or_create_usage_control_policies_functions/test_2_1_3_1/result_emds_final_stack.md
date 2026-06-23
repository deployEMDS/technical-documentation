## [2.1.3.1] Data product publication: Provision - Reuse or create usage control policies / functions

### Stack: EMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the EMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `emds_final_stack` |
| Stack under assessment | EMDS Final Stack (EDC-based) |
| KPI1 area | Policy management |
| Existing test ID | `2.1.3.1` |
| Level | Technical |
| ISO/IEC 25010 mapping | Security, Maintainability |
| Owner (tentative) | Xavier (Eurocat) |
| Reviewer | TBD |
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

Assess how Usage Control Policies are deployed. Rank the result by API coverage and ease of use (i.e. avoiding multiple calls with parameter passing) by scoring the following actions

1. Create a new policy
2. Assign a usage policy to a sharing agreement
3. Delete a sharing agreement
4. Delete a usage policy
5. Update existing sharing agreement
6. Update existing usage policy
7. Extend the usage policy language
7. Create new policy enforcement functions

#### Expected Output

See `test.md` for the complete expected output and comparative criteria for this test.

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

| Action | **Functional Completeness** | **Functional Correctness** | **Functional Appropriateness** | Explanation |
|----------------------------------------------|-----------------------------|----------------------------|--------------------------------|---------------------------------------------------------------|
| Create a new policy | TBD | TBD | TBD | TBD |
| Assign a usage policy to a sharing agreement | TBD | TBD | TBD | TBD |
| Delete a sharing agreement | TBD | TBD | TBD | TBD |
| Delete a usage policy | TBD | TBD | TBD | TBD |
| Update existing sharing agreement | TBD | TBD | TBD | TBD |
| Update existing policy | TBD | TBD | TBD | TBD |
| Extend the usage policy language | TBD | TBD | TBD | TBD |
| Create new policy enforcement functions | TBD | TBD | TBD | TBD |
| **Overall** | TBD | TBD | TBD | TBD |

**Functional Suitability Quality Metric Score:** TBD

#### Notes

This result introduces an **EMDS Final Stack** perspective for the existing test `2.1.3.1` under the KPI1 area **Policy management**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

This result file was generated from the local `test.md` and, where available, the local `result_edc_vc.md` structure. EDC+VC-specific evidence, values and scores were intentionally not reused.
