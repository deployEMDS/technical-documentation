## [2.2.3.1C] Data product publication: Publication - Publication on EMDS catalogue
### Stack: SIMPL

### Statement of assessment
#### Environment
The testing environment is an IMEC self-deployed instances of [Simpl-Open](https://code.europa.eu/simpl/simpl-open) on an IONOS Kubernetes cluster, the version used is 1.0.

#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
The test aims to evaluate the catalog publication process for a data product under the condition that a new data product cannot be published on the catalog.

### Results
During the [data offering process](https://code.europa.eu/simpl/simpl-open/development/data1/sdtooling-api-be/-/blob/main/README.md?ref_type=heads#access-policies), the data provider can set access policies to specify which user roles can search the dataset from their catalog. Once the data offering is published, only users with the appropriate roles can search for the dataset in their catalog. Therefore, in the context of SIMPL, certain offers may not be visible in some users' catalogs, resulting in the data product not being published for those participants.

#### Measured results
As outlined above, SIMPL supports a process where a new data product cannot be published on the catalog if proper policies are defined. SIMPL provides a user-friendly interface for provider defines access policies. Therefore, the test is assigned the following score:

**Functional Suitability Quality Metric: 4**

#### Notes
The current testing version of SIMPL is a very basic Minimum Viable Product solution, version 1.0.