## [4.2.3.1] Sharing agreement: Negotiation - Refusal or registration of sharing agreement

### Stack: protoEMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the protoEMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `protoemds_final_stack` |
| Stack under assessment | protoEMDS Final Stack (EDC-based) |
| KPI1 area | Security and restricted access |
| Existing test ID | `4.2.3.1` |
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

This result reuses the existing stack-agnostic test definition in `test.md` and adds an protoEMDS Final Stack integration-assessment perspective.

It does not replace the historical stack-specific result files, such as `result_edc_vc.md` or `result_fiware.md`.

The quality metric, expected output and comparative criteria remain those defined by the original test. This result file should only capture the evidence and assessment outcome for the selected protoEMDS Final Stack deployment.

#### Test-specific assessment scope

Check whether the negotiation API, or the status messages, or the negotiation logs, are not accessible to entities other than the negotiating participants and the system admin (privileged role).

#### Expected Output

The test aims to evaluate whether the negotiation API, status messages, and negotiation logs are accessible only to the negotiating participants and the system admin. The system admin is a technically privileged role whose identity is not necessarily that of a participant.

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
| **No Coverage:** The solution fails to meet any of the specified technical requirements. This indicates a complete lack of implementation concerning the requirements. There is no functionality to manage negotiation APIs, status messages, or logs, or they are accessible by unauthorized users, compromising security. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Minimal Coverage:** The solution meets up to 25% of the technical requirements. Basic elements may be present, such as rudimentary access controls or a partial implementation of the negotiation API. However, significant gaps exist, such as missing or improperly secured status messages and logs, allowing unauthorized access, or only basic encryption without role differentiation. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Partial Coverage:** The solution satisfies approximately 50% of the technical requirements. The negotiation API is implemented with basic access control, but not all security measures are in place. For instance, status messages and logs might be accessible only to participants but not properly restricted from non-participating users or system admins. Encryption might be present but inconsistently applied. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Significant Coverage:** The solution covers about 80% of the technical requirements. Most key functionalities are implemented effectively. The negotiation API, status messages, and logs are generally restricted to negotiating participants and the system admin. However, there may be minor vulnerabilities or inconsistencies, such as edge cases where unauthorized access could occur or some roles are not clearly distinguished. | TBD | TBD | Pending protoEMDS Final Stack assessment. |
| **Full Coverage:** The solution fully meets all technical requirements, ensuring that the negotiation API, status messages, and negotiation logs are strictly accessible only to the negotiating participants and the system admin. The system admin role is fully defined and technically privileged, with no overlap with participant identities unless explicitly intended. Strong encryption and access controls are applied consistently. | TBD | TBD | Pending protoEMDS Final Stack assessment. |

**Functional Suitability Quality Metric:** TBD

#### Notes

This result introduces an **protoEMDS Final Stack** perspective for the existing test `4.2.3.1` under the KPI1 area **Security and restricted access**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

This result file was generated from the local `test.md` and, where available, the local `result_edc_vc.md` structure. EDC+VC-specific evidence, values and scores were intentionally not reused.


