## [5.1.1.1] Data sharing: Data sharing request - Request data transfer

### Stack: EMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

- Assessment context: Integration phase assessment of the EMDS final technical infrastructure.
- Deployment model: TBD
  - CaaS / IONOS-managed deployment
  - On-premise deployment
- Target environment: TBD
- EDC version / release: TBD
- Connector deployment reference: TBD
- Assessment evidence: TBD

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

This result does not belong to the original deployEMDS Phase 1 / Phase 2 testing campaign used for the initial stack comparison. Instead, it reuses the existing test definition to assess the EMDS final technical infrastructure during the integration phase.

For the EMDS Final Stack, the assessment focuses on whether the current EDC-based infrastructure provides a documented, secured and testable mechanism to initiate and manage data transfer requests.

#### Expected Output

The test aims to provide a comprehensive evaluation of the following aspects:

- **Assess the availability of the API:** Ensure that the API or equivalent transfer mechanism is accessible and functional in the EMDS Final Stack.
- **Test data sharing requests:** Verify that data sharing requests are correctly processed, covering these steps:
    - Initiating a data sharing request.
    - Retrieving information and status of the data sharing request.
    - Receiving the outcome of the data sharing request, including conditions.
    - Accessing information on past data sharing activities.
- **Assess deployment-specific evidence:** Indicate whether the assessment was performed in a CaaS or on-premise deployment.

The system will score higher if the API is secured, implements common methods such as REST, and can be validated with repeatable technical evidence in the selected deployment model.

### Results

#### Assessment

TBD.

The assessment should be completed once consolidated evidence is available for the EMDS Final Stack deployment.

The result should indicate whether the score applies to:

- CaaS / IONOS-managed deployment;
- on-premise deployment;
- or both deployment models.

#### Deployment model assessed

| Deployment model | Status | Evidence | Consolidated assessment |
|---|---|---|---|
| CaaS / IONOS-managed deployment | TBD | TBD | TBD |
| On-premise deployment | TBD | TBD | TBD |

#### Measured results

| Requirement | Measured KPI | Evidence | Notes |
|---|---:|---|---|
| Initiate a data sharing request | TBD | TBD | Pending assessment based on execution evidence from the selected deployment model. |
| Retrieve data sharing information and status | TBD | TBD | Pending assessment based on evidence of transfer process status retrieval. |
| Receive data sharing request outcome condition | TBD | TBD | Pending assessment based on evidence that the transfer request outcome can be retrieved and interpreted. |
| Retrieve data sharing information of past data sharing actions | TBD | TBD | Pending assessment based on evidence of traceability or access to previous transfer actions. |

**Overall Calculation:** TBD  
**Functional Suitability Quality Metric Score:** TBD

#### Notes

This result introduces an **EMDS Final Stack** perspective for the existing test. It does not replace the historical **EDC+VC** or **Fiware** results.

This result should not be interpreted as part of the original Phase 1 / Phase 2 testing campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The assessment should be completed using consolidated technical evidence, such as endpoint responses, logs, screenshots, Postman/curl executions, GitHub/Jira references, deployment status or confirmation from the relevant component owner.

If the test is executed in both CaaS and on-premise environments, the result should clearly indicate whether the score applies to one deployment model or to both.