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
( 4 + 4 + 2 + 2 + 4) / 5 = 3.2

#### Notes

