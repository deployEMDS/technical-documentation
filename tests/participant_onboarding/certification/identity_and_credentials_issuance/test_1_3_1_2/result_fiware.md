## [1.3.1.2] Participant onboarding: Certification - Identity and credentials issuance
### Stack: Fiware

### Statement of assessment
#### Environment
The test is conducted in the IONOS FIWARE_cluster cluster using node pool IP 85.215.161.198.

#### Tested quality metric and method

The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). For the current phase (phase 1), the test focuses on the Functional Suitability quality metric.

#### Comparative criteria (checklists, ...)
**Levels of Assurance (LoAs)**

| **Level of Assurance (LoA)** | **Description**                                                                                                 | **Score (0-4)** |                                                                                           |
|------------------------------|-----------------------------------------------------------------------------------------------------------------|-----------------|-----------------------------------------------------------------------------------------------------------|
| **LoA 0**                     | No assurance provided. Identity is not verified or trusted.                                                     | 0                          |
| **LoA 1**                     | Minimal assurance. Basic identity checks are performed, such as self-assertion or simple verification.          | 1               |
| **LoA 2**                     | Moderate assurance. Identity verification includes some trusted sources or checks, such as document verification. | 2               |
| **LoA 3**                     | Substantial assurance. Strong identity verification processes, including in-person verification or multiple sources. | 3                |
| **LoA 4**                     | High assurance. The highest level of identity verification, often involving biometric data or multi-factor authentication. | 4               |  |



#### Expected output
Evidence regarding one of the Levels of Assurance.

### Results
#### Assessment


The FIWARE Connector typically provides **Level of Assurance (LoA) 2** to **LoA 3**. 

- **LoA 2:** FIWARE supports moderate assurance through its integration with identity management solutions like Keycloak, enabling secure authentication and role-based access control.
- **LoA 3:** With advanced features such as Attribute-Based Access Control (ABAC) using Open Policy Agent (OPA) and compliance with standards like XACML, the FIWARE Connector can offer high assurance for sensitive data exchange and access control in data spaces.
  
The exact LoA depends on the specific configuration and integration of the FIWARE Connector within an organization’s infrastructure.


#### Measured results
The criteria used to measure the results was the one specified in the comparative critera section. 

**Overall score:** 3 

#### Notes

