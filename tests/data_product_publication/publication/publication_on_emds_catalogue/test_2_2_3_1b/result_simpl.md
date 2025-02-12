## [2.2.3.1B] Data product publication: Publication - Publication on EMDS catalogue
### Stack: SIMPL

### Statement of assessment
#### Environment
The testing environment is an IMEC self-deployed instances of [Simpl-Open](https://code.europa.eu/simpl/simpl-open) on an IONOS Kubernetes cluster, the version used is 1.0.

#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
Test the process of catalogue publication for a data product under the following conditions: an existing data product is published on the catalogue
The EMDS catalog, as defined in the relevant documentation, refers to the Data Space-only catalog, specifically the SIMPL's federation component.

### Results
#### Assessment
[Simpl-Open](https://code.europa.eu/simpl/simpl-open) does not provide an endpoint to publish a catalog directly. The process involves data provider create a self-description of the data offering, set access policy to define who can access the dataset, and publish the data offering.
Publish the data offering will make the data product available in target user's federated catalog.

As a result, current test yields the same outcome as [Test 2.2.3.1a](..\test_2_2_3_1a\result_simpl.md). Since the catalog is built from the existing data product when a request is triggered, there is no difference between a newly published data product and one that already exists.

#### Measured results
As demonstrated above, current test shares the same result as [Test 2.2.3.1a](..\test_2_2_3_1a\result_simpl.md). 

**Functional Suitability Quality Metric: 4**

#### Notes
The current testing version of SIMPL is a very basic Minimum Viable Product solution, version 1.0.   
