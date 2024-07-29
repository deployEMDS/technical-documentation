## [2.2.3.1D] Data product publication: Publication - Publication on EMDS catalogue
### Stack: EDC+VC
### Statement of assessment
#### Environment
- The test utilizes the EDC MVD commit [9a5f93c](https://github.com/eclipse-edc/MinimumViableDataspace/commit/9a5f93c89cf5624cc4bf8eaa024a29da9b8e3d12).
- The test is executed in an Ubuntu environment using IntelliJ.
#### Tested quality metric and method
The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx)
For current phase (phase 1), the test focus on the Functional suitability quality metric.
#### Comparative criteria (checklists, ...)
[TODO] Describe the comparative criteria used for the test / assessment. If possible, align with the criteria used for the same test in the other stack(s).

#### Expected output
The test aims to examine the process of catalog de-publication for a data product under the following conditions: a data product is removed (de-published) from the catalog. The EMDS catalog, as defined in the relevant documentation, refers to the Data Space-only catalog, specifically the internal EDC catalog and its federation component.

### Results
#### Assessment

From the EDC MVD commit [9a5f93c](https://github.com/eclipse-edc/MinimumViableDataspace/commit/9a5f93c89cf5624cc4bf8eaa024a29da9b8e3d12), we observe that EDC provides APIs for managing data products (assets), including their de-publication:

```sh
curl -X 'DELETE' \
'https://{Connector}/v3/assets/{Asset-ID}' \
-H 'accept: */*'
```

This `curl` command is used to remove the specified data product (asset) from the connector. Since the connector does not maintain a local persistent catalog and generates the catalog dynamically, querying the catalog via the endpoint `{{Connector}}/api/management/v3/catalog/request` will reflect the current state of the catalog. Consequently, de-publishing an asset will result in its removal from the catalog returned by this endpoint.

#### Measured results
[TODO] Describe the measured results (quantitative results), if applicable. Rank the results according to the expected output, if applicable.

#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to create their own extensions.