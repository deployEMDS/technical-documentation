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


| **Criterion**          | **Description**                                                                                          | **Score (0-4)** |
|------------------------|----------------------------------------------------------------------------------------------------------|-----------------|
| **Confidentiality**     | The platform ensures that data are accessible only to those authorized to have access according to the data negotiation. | 4               |
| **Integrity**          | How the platform prevents unauthorized access to, or modification of the data.                            | 4               |
| **Non-repudiation**    | How the actions or events can be proven to have taken place so that the events or actions cannot be repudiated later. | 2               |
| **Accountability**     | The actions of an entity can be traced uniquely to the entity.                                            | 2               |
| **Authenticity**       | The resource can be proved to be the one claimed.                                                         | 4               |


**Overall score: ( 4 + 4 + 2 + 2 + 4) / 5 = 3.2**


#### Notes

