## [1.2.2.1] Participant onboarding: Evaluation - Proof of identity
### Stack: Fiware

### Statement of assessment
#### Environment

The test is conducted in the IONOS FIWARE_cluster cluster using node pool IP 85.215.161.198.

#### Tested quality metric and method

The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). For the current phase (phase 1), the test focuses on the Functional Suitability quality metric.


#### Comparative criteria (checklists, ...)
Assess if the data space can validate requestors’ real-world identities from national identity providers.

#### Expected output
The expected output of this test is to evaluate the level of customization required to use European/National identity provider as issuer for verifiable credentials.

### Results
#### Assessment
The connector only addresses natural persons, and to do so it utilizes tools such as Keycloak to issue certificates. 
Organizations' oboarding is done by a trust anchor, not the connector. 

 

#### Measured results
The criteria used to measure the results was the one specified by the Data Product Publication ISO25010 Quality file regarding Security.


| **Criterion**          | **Description**                                                                                          | **Score (0-4)** | **Explanation** |
|------------------------|----------------------------------------------------------------------------------------------------------|-----------------|-----------------|
| **Confidentiality**    | The platform ensures that data are accessible only to those authorized to have access according to the data negotiation. | 4               | The Fiware connector uses Keycloak for issuing certificates, which enforces strong access controls and ensures that data access is restricted to authorized entities only. This level of confidentiality aligns with best practices for data protection. |
| **Integrity**          | How the platform prevents unauthorized access to, or modification of the data.                            | 4               | The system maintains high data integrity by preventing unauthorized modifications. Keycloak and other tools are used to enforce strict data protection measures, ensuring that data remains accurate and unaltered. |
| **Non-repudiation**    | How the actions or events can be proven to have taken place so that the events or actions cannot be repudiated later. | 2               | While the platform provides mechanisms for tracking actions, the current implementation does not fully support non-repudiation. For example, the integration with identity providers may lack comprehensive logging and proof mechanisms for all actions. |
| **Accountability**     | The actions of an entity can be traced uniquely to the entity.                                            | 2               | The system’s ability to trace actions back to specific entities is limited. Although Keycloak facilitates identity management, additional measures may be needed to fully track and attribute all actions to individual entities, especially for organizations. |
| **Authenticity**       | The resource can be proved to be the one claimed.                                                         | 4               | The platform effectively ensures the authenticity of resources through the use of Keycloak for issuing verifiable credentials. This approach provides strong evidence that resources are as claimed, supporting robust identity verification processes. |



**Overall score: ( 4 + 4 + 2 + 2 + 4) / 5 = 3.2**


#### Notes

