## [1.2.2.1] Participant onboarding: Evaluation - Proof of identity
### Stack: SIMPL

### Statement of assessment
#### Environment
The testing environment is an IMEC self-deployed instances of [Simpl-Open](https://code.europa.eu/simpl/simpl-open) on an IONOS Kubernetes cluster, the version used is 1.0.

#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
**The expected output of this test is to evaluate the level of customization required to use European/National identity provider as issuer for verifiable credentials.**

### Results
#### Assessment
The participant within [Simpl-Open](https://code.europa.eu/simpl/simpl-open) is not identified by a Verifiable Credential, and the authentication authorization flow does not follow the typical VC process. 

However, as detailed in the [test_1_2_1_1](../../self-assessment/test_1_2_1_1/result_simpl.md), the authority can establish onboarding procedures for each participant role and may require a specific type of European/National identity in Verifiable Credential format for the onboarding process.

To validate that verifiable credential, [Simpl-Open](https://code.europa.eu/simpl/simpl-open) requires a manual approval or additional extension, the current onboarding process is with manual approval by the authority (Notary).

#### Measured results

| **Criterion**          | **Description**                                                                                          | **Score (0-4)** | **Explanation**                                                                                                                                        |
|------------------------|----------------------------------------------------------------------------------------------------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Confidentiality**    | The platform ensures that data are accessible only to those authorized to have access according to the data negotiation. | 4               |                                                                                                                                                        |
| **Integrity**          | How the platform prevents unauthorized access to, or modification of the data.                            | 3               | 	  |
| **Non-repudiation**    | How the actions or events can be proven to have taken place so that the events or actions cannot be repudiated later. | 2               |                   |
| **Accountability**     | The actions of an entity can be traced uniquely to the entity.                                            | 3               | 	    |
| **Authenticity**       | The resource can be proved to be the one claimed.                                                         | 2               |  |

Overall Calculation: ( 4 + 4 + 4 + 4 + 4) / 5 = 2.4

Functional Suitability Quality Metric Score: 2.4

#### Notes
The current testing version of SIMPL is a very basic Minimum Viable Product solution, version 1.0.   
