## [2.2.3.1D] Data product publication: Publication - Publication on EMDS catalogue

### Stack: Fiware

### Statement of assessment

#### Environment

The test environment Fiware v0.2 was used as described in [Fiware Deployment v0.2](/deployment/fiware/README.md)

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output

An existing product offering and its product specification can be deleted from the catalog.

### Results

#### Assessment

##### Delete product offering

A provider can list all offerings with the following API call:

```sh
curl -v -X GET "${tmf_api_direct_complete_url}/tmf-api/productCatalogManagement/v4/productOffering"
```

A previously created product offering can be deleted with the following request (the PRODUCT_OFFER_ID must be replaced with the actual, url-encoded product offer id):

```sh
curl -v -X DELETE "${tmf_api_direct_complete_url}/tmf-api/productCatalogManagement/v4/productOffering/${PRODUCT_OFFER_ID}"
```

##### Delete product specification

A provider can list all product specifications with the following API call:

```sh
curl -v -X GET "${tmf_api_direct_complete_url}/tmf-api/productCatalogManagement/v4/productSpecification"
```

A previously created product specification can be deleted with the following request (the PRODUCT_SPEC_ID must be replaced with the actual, url-encoded product specification id):

```sh
curl -v -X DELETE "${tmf_api_direct_complete_url}/tmf-api/productCatalogManagement/v4/productSpecification/${PRODUCT_SPEC_ID}"
```

#### Measured results

As demonstrated above, the TM Forum API provided by FIWARE can be used to delete a published product offering and product specification by the provider.

This process removes the data product from the catalog.

Based on the criteria outlined in the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section of the test description, the test is assigned the following score: **Functional Suitability Quality Metric: 4**
