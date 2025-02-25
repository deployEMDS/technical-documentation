## [1.3.1.5] Participant onboarding: Certification - Identity and credentials issuance
### Stack: SIMPL

### Statement of assessment
#### Environment
The testing environment is an IMEC self-deployed instances of [Simpl-Open](https://code.europa.eu/simpl/simpl-open) on an IONOS Kubernetes cluster, the version used is 1.0.

#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
The expected output of the test is an assessment of whether the SIMPL supports the full credential lifecycle, including request, issuance, validation, renewal, and revocation.

### Results
#### Assessment
[Simpl-Open](https://code.europa.eu/simpl/simpl-open) does not yet support Verifiable Credentials for identity authentication and authorization in Data Space flow. 
The Verifiable Credential lifecycle is not supported by [Simpl-Open](https://code.europa.eu/simpl/simpl-open) for identity management for now.

In the design of tier 2 layer of the identity, which is based on Attribute-Based Access Control, the SIMPL agent receives an x.509 certificate from the authority agent to establish mTLS communication with the other agents. 
This certificate will be presented in a Verifiable Credential, but it is not yet available in the current version of SIMPL.

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

#### Notes
The current testing version of SIMPL is a very basic Minimum Viable Product solution, version 1.0.   
