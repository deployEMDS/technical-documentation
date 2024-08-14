## [2.2.3.4] Data product publication: Publication - Publication on EMDS catalogue
### Stack: EDC + VC

### Assessment Overview

#### Environment
- The test leverages the EDC MVD commit [8da0c4e](https://github.com/eclipse-edc/MinimumViableDataspace/commit/8da0c4e6a8921dcb6ff189c2901868979bdc9a93).
- It uses EDC version [0.8.2-SNAPSHOT](https://github.com/eclipse-edc/MinimumViableDataspace/blob/8da0c4e6a8921dcb6ff189c2901868979bdc9a93/gradle/libs.versions.toml#L7).
- The test is performed on an Ubuntu environment with IntelliJ.

#### Quality Metric and Testing Method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).\
For the current phase (Phase 1), the test focuses on the Functional Suitability metric.

#### Comparative Criteria
[TODO] Provide details on the comparative criteria used for this test/assessment. Align these criteria with those used in similar tests across other stacks, if applicable.

#### Expected Outcome
This test aims to evaluate the process for de-publishing a catalog or making a catalog entry private.

### Results

#### Assessment
###### De-publishing a Catalog
As detailed in [test_2_2_3_1d](../test_2_2_3_1d/result_fiware.md), EDC does not provide a direct endpoint for (de)publishing a catalog. Instead, the process requires a series of API calls to publish individual components: an asset, its associated policy, and its contract. EDC then aggregates this data to dynamically construct a catalog upon request. Consequently, publishing a data asset along with its policy and contract leads to the creation or updating of the catalog.\
Similarly, if a data asset is removed, the EDC connector automatically updates the catalog accordingly.
The current test yields the same results as [test_2_2_3_1d](../test_2_2_3_1d/result_fiware.md) concerning catalog de-publishing.

###### Making a Catalog Entry Private
As mentioned, the EDC framework dynamically builds the catalog, and its policy engine, a generic building block, processes policies written in ODRL.\
Policies can be applied to catalog queries, as shown in [access control](https://github.com/eclipse-edc/MinimumViableDataspace?tab=readme-ov-file#33-access-control) from EDC MVD commit [8da0c4e](https://github.com/eclipse-edc/MinimumViableDataspace/commit/8da0c4e6a8921dcb6ff189c2901868979bdc9a93).\
To access the catalog, a `MembershipCredential` must be presented. This means that the catalog can be hidden from specific users with the correct policy definition and policy engine implementation.

#### Measured Outcomes
As outlined above, the test results align with [test_2_2_3_1d](../test_2_2_3_1d/result_fiware.md) regarding catalog depublication. Catalog consultation restrictions can be applied to catalog queries, but require customized implementation.
Therefore, the following score is given to the test.

**Functional Suitability Quality Metric: 3**

#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to create their own extensions.