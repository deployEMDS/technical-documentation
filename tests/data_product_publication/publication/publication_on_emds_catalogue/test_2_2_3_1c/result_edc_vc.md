## [2.2.3.1C] Data product publication: Publication - Publication on EMDS catalogue
### Stack: EDC+VC

### Statement of assessment

#### Environment
- The test leverages the EDC MVD commit [8da0c4e](https://github.com/eclipse-edc/MinimumViableDataspace/commit/8da0c4e6a8921dcb6ff189c2901868979bdc9a93).
- It uses EDC version [0.8.2-SNAPSHOT](https://github.com/eclipse-edc/MinimumViableDataspace/blob/8da0c4e6a8921dcb6ff189c2901868979bdc9a93/gradle/libs.versions.toml#L7).
- The test is performed on an Ubuntu environment with IntelliJ.

#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
The test aims to evaluate the catalog publication process for a data product under the condition that a new data product cannot be published on the catalog.
### Results
#### Assessment
As detailed in [test_2_2_3_1d](../test_2_2_3_1d/result_fiware.md), EDC does not provide a direct endpoint for (de)publishing a catalog. Instead, the process involves a sequence of API calls to publish individual components: an asset, its associated policy, and its contract. EDC then dynamically constructs a catalog by aggregating this data upon request. Therefore, publishing a data asset along with its policy and contract leads to the creation or update of the catalog.

EDC's policy engine, a generic building block, processes policies written in ODRL. These policies can be applied to catalog queries, as demonstrated in the [access control](https://github.com/eclipse-edc/MinimumViableDataspace?tab=readme-ov-file#33-access-control) section of the EDC MVD commit [8da0c4e](https://github.com/eclipse-edc/MinimumViableDataspace/commit/8da0c4e6a8921dcb6ff189c2901868979bdc9a93). The demo showed a policy requiring a `MembershipCredential` to access the catalog, effectively allowing the catalog of certain products to remain unpublished for specific users.

Therefore, with properly defined policies, users can choose to publish the catalog based on the identification of the incoming catalog query.

#### Measured results
As outlined above, EDC supports a process where a new data product cannot be published on the catalog if proper policies are defined. However, the policy engine and policies require customized implementation within the EDC framework. Therefore, based on the criteria outlined in the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section of the test description, the test is assigned the following score:
**Functional Suitability Quality Metric: 2**

#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to create their own extensions.