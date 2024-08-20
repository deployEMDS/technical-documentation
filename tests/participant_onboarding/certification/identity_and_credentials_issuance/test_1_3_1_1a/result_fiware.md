## [1.3.1.1A] Participant onboarding: Certification - Identity and credentials issuance
### Stack: Fiware

### Statement of assessment
#### Environment

The test is conducted in the IONOS FIWARE_cluster cluster using node pool IP 85.215.161.198.

#### Tested quality metric and method

The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). For the current phase (phase 1), the test focuses on the Functional Suitability quality metric.

#### Comparative criteria (checklists, ...)
Asses that the stack uses a credential framework that is compatible with this initiative: Gaia-X

#### Expected output
Compatibility specifications regarding Gaia-X.

### Results
#### Assessment
The documentation states in the onboarding steps that the organization validates that the VC containing its description as organization is compliant with Gaia-X specifications using the services of a Gaia-X Digital Clearing House. Therefore it is compatible with Gaia-X framework.

#### Measured results
The criteria used to measure the results was the one specified by the Data Product Publication ISO25010 Quality file regarding Functional Suitability.


| **Criterion**                | **Description**                                                                                     | **Score (0-4)** | **Explanation** |
|------------------------------|-----------------------------------------------------------------------------------------------------|-----------------|-----------------|
| **Functional Completeness**   | Technical requirements cover all the specified tasks and user objectives.                          | 3               | The FIWARE Connector largely covers the tasks necessary for Gaia-X compliance, including credential management and data exchange. However, certain advanced Gaia-X features, such as more granular access control, may require further enhancement. |
| **Functional Correctness**    | Technical requirements meet results with the needed degree of precision.                           | 3               | The FIWARE Connector effectively supports the validation of Verifiable Credentials (VCs) in line with Gaia-X specifications. While the general precision is high, some specific Gaia-X compliance checks may need additional refinement to ensure full correctness in complex scenarios. |
| **Functional Appropriateness**| Technical requirements facilitate the accomplishment of specified tasks and objectives.            | 3               | The platform is well-suited for Gaia-X compliant operations, such as VC issuance and verification. However, certain workflows, particularly around revocation and renewal processes, could be streamlined to better align with Gaia-X's evolving standards. |





**Overall score: ( 3 + 3 + 3)/ 3 = 3**


#### Notes
More information about it:  [https://github.com/FIWARE/data-space-connector](https://github.com/FIWARE/data-space-connector)

