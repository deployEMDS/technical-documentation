## [2.2.3.1C] Data product publication: Publication - Publication on EMDS catalogue
### Stack: EDC+VC

### Statement of assessment

#### Environment
- The test leverages the EDC MVD commit [8da0c4e](https://github.com/eclipse-edc/MinimumViableDataspace/commit/8da0c4e6a8921dcb6ff189c2901868979bdc9a93).
- It uses EDC version [0.8.2-SNAPSHOT](https://github.com/eclipse-edc/MinimumViableDataspace/blob/8da0c4e6a8921dcb6ff189c2901868979bdc9a93/gradle/libs.versions.toml#L7).
- The test is performed on an Ubuntu environment with IntelliJ.

#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).\
For the current phase (Phase 1), the test focuses on the Functional Suitability metric.

#### Comparative criteria (checklists, ...)
[TODO] Describe the comparative criteria used for the test / assessment. If possible, align with the criteria used for the same test in the other stack(s).
#### Expected output
The test aims to evaluate the catalog publication process for a data product under the condition that a new data product cannot be published on the catalog.

### Results
#### Assessment
As detailed in [test_2_2_3_1d](../test_2_2_3_1d/result_fiware.md), EDC does not offer a direct endpoint for (de)publishing a catalog. Instead, the process involves a series of API calls to publish individual components: an asset, its associated policy, and its contract. EDC then dynamically constructs a catalog by aggregating this data upon request. Therefore, publishing a data asset, along with its policy and contract, results in the creation or update of the catalog.

EDC's policy engine, a generic building block, processes policies written in ODRL. These policies can be applied to catalog queries, as demonstrated in the [access control](https://github.com/eclipse-edc/MinimumViableDataspace?tab=readme-ov-file#33-access-control) section of the EDC MVD commit [8da0c4e](https://github.com/eclipse-edc/MinimumViableDataspace/commit/8da0c4e6a8921dcb6ff189c2901868979bdc9a93).

Accessing the catalog requires presenting a `MembershipCredential`, allowing the catalog to be hidden from specific users with the correct policy definition and policy engine implementation.
Therefore, with properly defined policies, users can choose to publish the catalog based on the identification of the incoming catalog query.

#### Measured results
As outlined above, the policy engine and policies require customized implementation within the EDC framework. Therefore, the following score is assigned to the test:

**Functional Suitability Quality Metric: 3**
#### Notes

EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to create their own extensions.