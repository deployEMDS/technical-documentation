## [1.3.1.1C] Participant onboarding: Certification - Identity and credentials issuance
### Stack: Fiware

### Statement of assessment
#### Environment

The test is conducted in the IONOS FIWARE_cluster cluster using node pool IP 85.215.161.198.

#### Tested quality metric and method

The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). For the current phase (phase 1), the test focuses on the Functional Suitability quality metric.

#### Comparative criteria (checklists, ...)
Asses that the stack uses a credential framework that is compatible with this initiative: EBSI

#### Expected output
Compatibility specifications regarding EBSI.


### Results
#### Assessment
The FIWARE documentation assess that the connector can effectively interface with trust services aligned with EBSI specifications by integrating decentralized identifiers, verifiable credentials, and EBSI-compliant trust services.

#### Measured results

The criteria used to measure the results was the one specified by the Data Product Publication ISO25010 Quality file regarding Functional Suitability.

| **Criterion**                | **Description**                                                                                     | **Score (0-4)** | **Explanation**                                                                 |
|------------------------------|-----------------------------------------------------------------------------------------------------|-----------------|---------------------------------------------------------------------------------|
| **Functional Completeness**   | Technical requirements cover all the specified tasks and user objectives.                          | 4               | The Fiware connector fully supports all necessary functions for identity and credential issuance, ensuring compatibility with EBSI standards, including decentralized identifiers and verifiable credentials. This ensures the platform can handle all tasks required by EBSI. |
| **Functional Correctness**    | Technical requirements meet results with the needed degree of precision.                           | 4               | The implementation of EBSI-compatible services is precise and reliable, correctly issuing credentials and managing identities as per the specifications. The integration is robust, with accurate handling of the trust services. |
| **Functional Appropriateness**| Technical requirements facilitate the accomplishment of specified tasks and objectives.            | 4               | The platform’s design and functionality are well-suited to the requirements of EBSI, enabling efficient and effective credential issuance and identity management. It supports the necessary processes without unnecessary complexity, facilitating smooth operations. |

**Overall score:** (4 + 4 + 4)/3 = 4 



#### Notes
More information about it:  [https://github.com/FIWARE/data-space-connector](https://github.com/FIWARE/data-space-connector)
