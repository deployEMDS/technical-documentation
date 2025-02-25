## [2.1.3.1] Data product publication: Provision - Reuse or create usage control policies / functions
### Stack: SIMPL

### Statement of assessment
#### Environment
The testing environment is an IMEC self-deployed instances of [Simpl-Open](https://code.europa.eu/simpl/simpl-open) on an IONOS Kubernetes cluster, the version used is 1.0.

#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
The test aims to assess how Usage Control Policies are deployed. 

### Results
#### Assessment

[Simpl-Open](https://code.europa.eu/simpl/simpl-open) utilizes the [SIMPL EDC Connection](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-edc) to handle the [Dataspace Protocol](https://docs.internationaldataspaces.org/ids-knowledgebase/dataspace-protocol). 
The [SIMPL EDC Connection](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-edc) includes the management API and policy engines of EDC. 

Consequently, from an API perspective, SIMPL shares the same API functions for managing policies as detailed in [result_edc_vc.md](result_edc_vc.md). 

However, based on observations, the development focus of SIMPL are on user interfaces, such as [simpl-sd-ui](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-sd-ui), which allows data providers to create a self-description of the data product, including access and usage policies. 
These user interfaces do not support functions for deletion or extending usage functions.

#### Measured results
Since SIMPL's is packaged for Kubernetes, API access is challenging for its target users. However, as it uses EDC component's management APIs, the same API functions are available, and similar results should be shared between these two stacks. Therefore, the following scores are assigned to the test:
The criteria used to measure the results was the one specified by the Data Product Publication ISO25010 Quality file regarding Functional Suitability. Individual scores per action are detailed in the table below, as some actions received different scores according to the defined criteria.

| Action                                       | **Functional Completeness**    | **Functional Correctness**     | **Functional Appropriateness**            | Explanation |
|----------------------------------------------|--------------------------------|--------------------------------|-------------------------------------------|-------------|
| Create a new policy                          | 4                              | 4                              | 4                                         |             |
| Assign a usage policy to a sharing agreement | 4                              | 4                              | 4                                         |             |
| Delete a sharing agreement                   | 4                              | 4                              | 4                                         |             |
| Delete a usage policy                        | 4                              | 4                              | 2                                         |             |
| Update existing sharing agreement            | 4                              | 4                              | 3                                         |             |
| Update existing policy                       | 4                              | 4                              | 4                                         |             |
| Extend the usage policy language             | 1                              | 1                              | 1                                         |             |
| Create new policy enforcement functions      | 1                              | 1                              | 1                                         |             |
| **Overall**      | **(4 * 6 + 1 * 2) / 8 = 3.25** | **(4 * 6 + 1 * 2) / 8 = 3.25** | **(4 * 4 + 3 + 2 + 1 * 2) / 8 = 2.875**   |             |
 
Overall score calculation: (3.25 + 3.25 + 2.875) / 3 = 3.125

**Functional Suitability Quality Metric Score: 3.125**
#### Notes

The current testing version of SIMPL is a very basic Minimum Viable Product solution, version 1.0.   