## [1.3.1.5] Participant onboarding: Certification - Identity and credentials issuance
### Stack: SIMPL

### Statement of assessment
#### Environment
The testing environment is an IMEC self-deployed instances of Simpl-Open on an IONOS Kubernetes cluster, the version used is 1.0.

#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
The expected output of the test is an assessment of whether the SIMPL supports the full credential lifecycle, including request, issuance, validation, renewal, and revocation.


### Results
#### Assessment
SIMPL doesn't support Verifiable Credential as identity for authentication and authoritarian of Data Space flow,
The Verifiable Credential life cycle is not supported by SIMPL as identity management.


#### Measured results
The EDC implementation partially covers the VC lifecycle as outlined above.  Based on the criteria outlined in the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section of the test description, the test is assigned the following score:

| **VC Lifecycle Stage**          | **Coverage**                                                       | **Score (0-4)** |
|---------------------------------|--------------------------------------------------------------------|-----------------|
| **Issuance and Storage**         | Available with the workaround extension function `seedCredentials`. | 0               |
| **Presentation**                 | Covered                                                            | 0               |
| **Verification & Use**           | Covered                                                            | 0               |
| **Revocation/Expiration**        | Covered                                                            | 0               |
| **Renewal/Re-Issuance**          | Not covered.           | 0               |

**Overall Calculation: (0+0+0+0+0)/5 = 0**
Functional Suitability Quality Metric Score: 0
