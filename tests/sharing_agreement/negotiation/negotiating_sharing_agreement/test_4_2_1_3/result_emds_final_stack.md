## [4.2.1.3] Sharing agreement: Negotiation - Negotiating sharing agreement

### Stack: EMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the EMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `emds_final_stack` |
| Stack under assessment | EMDS Final Stack (EDC-based) |
| KPI1 area | Sharing agreement |
| Existing test ID | `4.2.1.3` |
| Level | Technical |
| ISO/IEC 25010 mapping | Functional suitability, Compatibility, Security |
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

Prove that the negotiation can use (one or more of) the following assets and parameters to define a contract:
- Claim verification
- Usage policy rules
- Service Agreements

The larger the coverage (i.e. more possibilities), the higher the rank.

#### Expected Output

The test aims to evaluate the coverage of the following criteria on contract negotiation:
- Claim verification
- Usage policy rules
- Service Agreements

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
| **No Proof:** The solution does not demonstrate the ability to use any of the specified assets or parameters (Claim Verification, Usage Policy Rules, Service Agreements) in the negotiation process to define a contract. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Limited Proof:** The solution demonstrates the ability to use only one of the specified assets or parameters in the negotiation process to define a contract. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Moderate Proof:** The solution demonstrates the ability to use two of the specified assets or parameters in the negotiation process to define a contract. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Extensive Proof:** The solution demonstrates the ability to use all three specified assets or parameters in the negotiation process to define a contract, though with some limitations in coverage or flexibility. | TBD | TBD | Pending EMDS Final Stack assessment. |
| **Comprehensive Proof:** The solution fully demonstrates the ability to use all three specified assets or parameters (Claim Verification, Usage Policy Rules, Service Agreements) in a flexible and comprehensive negotiation process, effectively covering a wide range of possibilities to define and manage contracts. | TBD | TBD | Pending EMDS Final Stack assessment. |

**Functional suitability quality metric:** TBD

#### Notes

This result introduces an **EMDS Final Stack** perspective for the existing test `4.2.1.3` under the KPI1 area **Sharing agreement**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

This result file was generated from the local `test.md` and, where available, the local `result_edc_vc.md` structure. EDC+VC-specific evidence, values and scores were intentionally not reused.
