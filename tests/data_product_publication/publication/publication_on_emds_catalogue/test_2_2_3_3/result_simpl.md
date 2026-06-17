## [2.2.3.3] Data product publication: Publication - Publication on EMDS catalogue
### Stack: Simpl

### Statement of assessment
#### Environment
The testing environment is an IMEC self-deployed instances of [Simpl-Open](https://code.europa.eu/simpl/simpl-open) on an IONOS Kubernetes cluster, the version used is 1.0.

#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
The test aims to verify the availability of a GUI for publishing a data product offering into the catalog and discovery tools.

### Results
#### Assessment
[Simpl-Open](https://code.europa.eu/simpl/simpl-open) is a project aimed at providing facilities for data spaces. It includes a data offering UI for participants, which can publish the following types of data projects:
- Services
  - Infrastructure offering
  - Application offering
  - Data offering
- Contract
The Simpl UI also includes functionality to validate the input information (Self Description) for each product type, using web page input validation and the SHACL shapes validation defined for each product type.
![simple_offering.png](images/simple_offering.png)

For dataset discovery, Simpl provides a UI that allows users to search for datasets based on the dataset name or perform advanced searches based on shapes, etc.
![simpl_catalog.png](images/simpl_catalog.png)

However, the [simpl-sd-ui](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-sd-ui) and [simpl-catalogue-client](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-catalogue-client) have very limited functionality. They do not support viewing published offerings or transfer history. Additionally, there is no URL redirection for logging back in after a user logs out. The UI is very minimal, featuring only the Simpl logo and a few options.

#### Measured results

Based on the previous explanation, Simpl offers a native GUI for data offering and catalog searching. However, as a minimum viable product, the UI only supports basic functions and lacks features such as delete functionality, session management, and the ability to consult transfer or negotiation histories. Therefore, the following score has been assigned to the test:

**Functional Suitability Quality Metric: 1**

#### Notes
The current testing version of Simpl is a very basic Minimum Viable Product solution, version 1.0.