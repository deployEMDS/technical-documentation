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
The FIWARE Connector provides partial coverage as it supports self-issued credentials, including GAIA-X compatible DID methods. However, it lacks comprehensive compliance or claim verification capabilities. While it supports key functionalities like ABAC and OPA integration, it does not fully implement policies for interpreting claims using SD classes or leveraging a GXDCH clearing house for business purposes.


**Score:** **2 (Partial Coverage)**

Functional Suitability Quality Metric Score: 2



#### Notes
More information about it:  [https://github.com/FIWARE/data-space-connector](https://github.com/FIWARE/data-space-connector)

