## [3.1.1.1] Data product survey: Discover - Consult data space catalogue

### Stack: Fiware

### Statement of assessment

#### Environment

The test environment Fiware v0.2 was used as described in [Fiware Deployment v0.2](/deployment/fiware/README.md)

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output

### Results

#### Assessment

The Fiware connector does not have a UI for interactive and complex searches.

The Fiware connector or its TM Forum catalog implementation provides a REST API to query the contents of the catalog. There are predefined query parameters to narrow the search for a specific product description or - offering. As the [TMF620 Product Catalog Management API User Guide v5.0.0](https://www.tmforum.org/resources/specifications/tmf620-product-catalog-management-api-user-guide-v5-0-0/#) states, Attribute selection is enabled for all first level
attributes of a product offering or description.

The TM Forum specification has a detailed description of handling multiple catalogs and catalog copies. The specification assumes that multiple independent catalogs can coexist independent of each other. The specification explains that difference product specifications and -offerings with different version can exist in the different, independent catalogs.

It also deals with the concept that catalogs can be synchronized. By synchronizing catalogs, e.g. a provider can have its own catalog that is updated by the provider and update events are sent to other catalogs that should update their contents according to the provider catalog.

Therefore distributing a catalog to other open source or non-open source catalogs inside or outside european projects should not be a problem using the functionality that TM Forum APIs provide.

Special attention needs to be given to role-based access that is specified for TM Forum catalogs. Since access control is a part of the specification, it should also be implemented in the non-EMDS catalog, that the TM Forum catalog might be synchronized to.

#### Measured results

As mentioned before, a UI is currently not available.

The API allows for text search in the basic fields.

The catalog can be synchronized with other catalogs.

Therefore we see a significant coverage of expected catalog features.

**Functional Suitability Quality Metric: 3**

#### Notes
