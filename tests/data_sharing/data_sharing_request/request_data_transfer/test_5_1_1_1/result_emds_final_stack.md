## [5.1.1.1] Data sharing: Data sharing request - Request data transfer

### Stack: EMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the EMDS Final Stack assessment is performed.

The assessment is expected to be completed using the deployment model for which evidence is realistically available. It is not mandatory to execute the same test in both CaaS and on-premise environments.

| Field                          | Value                                                                   | Guidance                                                                                                                                                                                                                                                 |
| ------------------------------ | ----------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Assessment context             | Integration phase assessment of the EMDS final technical infrastructure | Indicates that this result belongs to the integration phase and not to the original Phase 1 / Phase 2 stack-comparison campaign.                                                                                                                         |
| Result perspective             | `emds_final_stack`                                                      | Identifies this file as the EMDS Final Stack result perspective for the existing test definition.                                                                                                                                                        |
| Stack under assessment         | EMDS Final Stack (EDC-based)                                            | Indicates that the selected EMDS technical infrastructure is being assessed.                                                                                                                                                                             |
| Deployment model assessed      | TBD                                                                     | Specify the deployment model actually used to collect evidence. Usually this will be either CaaS / IONOS-managed deployment or on-premise deployment.                                                                                                    |
| Target environment             | TBD                                                                     | Specify the concrete environment used for the assessment, for example the IONOS Kubernetes cluster, namespace, local environment or other deployment target.                                                                                             |
| EDC version / release          | TBD                                                                     | Specify the EDC version, release, image tag or commit used in the assessed deployment, if available.                                                                                                                                                     |
| Connector deployment reference | TBD                                                                     | Reference the deployed connector version, image, Helm chart, Docker Compose setup, GitHub commit, release or other deployment artefact used for the assessment.                                                                                          |
| Assessment evidence            | TBD                                                                     | Reference the evidence used to support the assessment, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner. |

The deployment model should be completed using the option that matches the available evidence:

| Deployment model                | When to use it                                                                                                         |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| CaaS / IONOS-managed deployment | Use this when the assessment evidence comes from the EMDS infrastructure deployed or managed in the IONOS environment. |
| On-premise deployment           | Use this when the assessment evidence comes from a locally managed or partner-managed deployment.                      |

If only one deployment model is assessed, the other one should be marked as `Not assessed`. This is acceptable as long as the result clearly states which deployment model was used for the assessment.

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

This result does not belong to the original deployEMDS Phase 1 / Phase 2 testing campaign used for the initial stack comparison. Instead, it reuses the existing test definition to assess the selected EMDS technical infrastructure during the integration phase.

For the EMDS Final Stack, the assessment focuses on whether the current EDC-based infrastructure provides a documented, secured and testable mechanism to initiate and manage data transfer requests.

The existing test definition remains unchanged. This result file adds an EMDS Final Stack perspective next to the historical stack-specific result files, such as `result_edc_vc.md` and `result_fiware.md`.

#### Expected Output

The test aims to provide a comprehensive evaluation of the following aspects:

* **Assess the availability of the transfer mechanism:** Ensure that the API or equivalent transfer mechanism is accessible and functional in the EMDS Final Stack.
* **Test data sharing requests:** Verify that data sharing requests are correctly processed, covering these steps:

  * Initiating a data sharing request.
  * Retrieving information and status of the data sharing request.
  * Receiving the outcome of the data sharing request, including conditions.
  * Accessing information on past data sharing activities.
* **Assess deployment-specific evidence:** Indicate which deployment model was actually assessed, either CaaS / IONOS-managed deployment or on-premise deployment.
* **Assess repeatability:** Ensure that the assessment can be supported by repeatable technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

The system will score higher if the transfer mechanism is secured, implements common methods such as REST where applicable, and can be validated with repeatable technical evidence in the selected deployment model.

### Results

#### Assessment

Pending.

The assessment should be completed once consolidated evidence is available for the EMDS Final Stack deployment.

The result should clearly indicate which deployment model was assessed. It is acceptable to assess only one deployment model if evidence for the other deployment model is not available.

#### Deployment model assessed

| Deployment model                | Status | Evidence | Consolidated assessment                                                                                                             |
| ------------------------------- | ------ | -------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| CaaS / IONOS-managed deployment | TBD    | TBD      | Complete this row only if evidence is collected from the IONOS-managed deployment. Otherwise mark as `Not assessed`.                |
| On-premise deployment           | TBD    | TBD      | Complete this row only if evidence is collected from an on-premise or locally managed deployment. Otherwise mark as `Not assessed`. |

#### Measured results

| Requirement                                                    | Measured KPI | Evidence | Notes                                                                                                    |
| -------------------------------------------------------------- | -----------: | -------- | -------------------------------------------------------------------------------------------------------- |
| Initiate a data sharing request                                |          TBD | TBD      | Pending assessment based on execution evidence from the selected deployment model.                       |
| Retrieve data sharing information and status                   |          TBD | TBD      | Pending assessment based on evidence of transfer process status retrieval.                               |
| Receive data sharing request outcome condition                 |          TBD | TBD      | Pending assessment based on evidence that the transfer request outcome can be retrieved and interpreted. |
| Retrieve data sharing information of past data sharing actions |          TBD | TBD      | Pending assessment based on evidence of traceability or access to previous transfer actions.             |

**Overall Calculation:** TBD
**Functional Suitability Quality Metric Score:** TBD

#### Notes

This result introduces an **EMDS Final Stack** perspective for the existing test. It does not replace the historical **EDC+VC** or **Fiware** results.

This result should not be interpreted as part of the original Phase 1 / Phase 2 testing campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub issues, pull requests, repository references, deployment status or confirmation from the relevant component owner.

If the test is executed in only one deployment model, the result should clearly indicate which deployment model was assessed. The other deployment model may remain marked as `Not assessed`. If evidence is later collected for the second deployment model, this result file may be updated accordingly.
