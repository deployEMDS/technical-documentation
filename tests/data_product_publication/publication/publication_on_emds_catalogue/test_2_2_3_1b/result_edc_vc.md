## [2.2.3.1B] Data product publication: Publication - Publication on EMDS catalogue
### Stack: EDC+VC
### Statement of assessment
#### Environment
- The test utilizes the EDC MVD commit [9a5f93c](https://github.com/eclipse-edc/MinimumViableDataspace/commit/9a5f93c89cf5624cc4bf8eaa024a29da9b8e3d12).
- EDC version [0.8.1-snapshot](https://github.com/eclipse-edc/MinimumViableDataspace/blob/9a5f93c89cf5624cc4bf8eaa024a29da9b8e3d12/gradle/libs.versions.toml#L7)
- The test is executed in an Ubuntu environment using IntelliJ.
#### Tested quality metric and method
The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).\
For current phase (phase 1), the test focus on the Functional suitability quality metric.
#### Comparative criteria (checklists, ...)
[TODO] Describe the comparative criteria used for the test / assessment. If possible, align with the criteria used for the same test in the other stack(s).

#### Expected output
Test the process of catalogue publication for a data product under the following conditions: an existing data product is published on the catalogue
The EMDS catalog, as defined in the relevant documentation, refers to the Data Space-only catalog, specifically the internal EDC catalog and its federation component.
### Results
#### Assessment
EDC does not provide an endpoint to publish a catalog directly. The process involves a series of API calls to publish an asset, a policy, and a contract. EDC then extracts this information and dynamically builds a catalog when a request is made.
Therefore, publishing a data asset along with its policy and contract will result in the publication of a catalog.\
As a result, current test yields the same outcome as [Test 2.2.3.1a](..\test_2_2_3_1a\result_edc_vc.md). Since the catalog is built from the existing data product when a request is triggered, there is no difference between a newly published data product and one that already exists.

#### Measured results
As demonstrated above, current test shares the same result as [Test 2.2.3.1a](..\test_2_2_3_1a\result_edc_vc.md).

**Functional Suitability Quality Metric: 4**
#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to create their own extensions.
