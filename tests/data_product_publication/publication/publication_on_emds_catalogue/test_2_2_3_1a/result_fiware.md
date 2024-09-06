## [2.2.3.1A] Data product publication: Publication - Publication on EMDS catalogue

### Stack: Fiware

### Statement of assessment

#### Environment

The test environment Fiware v0.2 was used as described in [Fiware Deployment v0.2](/deployment/fiware/README.md)

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output

The test aims to examine the process of catalog publication for a data product under the following conditions: a new data product is added to the catalog. In this test, it is assumed that the EMDS catalog is made up of the TM Forum API implementation of FIWARE.

### Results

#### Assessment

The catalog offers an API to publish an offering. The catalog distinguishes between a Product Specification and a Product Offering.

A Product Specification is a detailed description of some of the attributes that will characterize products created when a Product Offering is successfully ordered. Properties of a Product Specification include name, product number, description, lifecycle status, whether it defines a product bundle and more.

A Product Offering represents offerings on products that are orderable from the provider of the catalog. It includes the specification of the products, pricing information, and other characteristics of the product that gets created when a Product Offering is procured. Properties of a Product Offering include name, description, version, last update, valid period, lifecycle status and more.

Therefore, for a product publication a Product Specification and a Product Offering must be created for a product. Then the product can be queried by a consumer in the catalog.

##### Testing against the TM Forum Catalog Management API

The test environment has a catalog instance deployed. A product specification can be created by the provider with the following API call:

```sh
curl -v -X POST "${tmf_api_direct_complete_url}/tmf-api/productCatalogManagement/v4/productSpecification" \
     -H 'Content-Type: application/json;charset=utf-8' \
     -d '{
        "brand": "Fraunhofer IVI",
        "version": "1.0.0",
        "lifecycleStatus": "ACTIVE",
        "name": "Ceres Robot Picture",
        "url": "https://www.ivi.fraunhofer.de/de/messe-events/jcr:content/contentPar/sectioncomponent_cop/sectionParsys/textwithasset_1468022064/imageComponent/image.img.4col.large.jpg/1725447613147/Feldtag-2022-Roh-big.jpg"
     }'
```

The catalog response contains a PRODUCT_SPEC_ID of the created product that is used in the next request to create a product offering that is linked to the product specification.

A product offer can be created by the provider with the following API call:

```sh
curl -X POST "${tmf_api_direct_complete_url}/tmf-api/productCatalogManagement/v4/productOffering" \
     -H 'Content-Type: application/json;charset=utf-8' \
     -d "{
        \"version\": \"1.0.0\",
        \"lifecycleStatus\": \"ACTIVE\",
        \"name\": \"Ceres Robot Picture Offering\",
        \"productSpecification\": {
          \"id\": \"${PRODUCT_SPEC_ID}\"
        }
     }"
```

A consumer can list all offerings with the following API call:

```sh
curl -v -X GET "${tmf_api_complete_url}/tmf-api/productCatalogManagement/v4/productOffering" -H "Authorization: Bearer ${SERVICE_ACCESS_TOKEN}"
```

Response:

```text
[
   {
      "id": "urn:ngsi-ld:product-offering:3383068b-3671-4654-ba3c-f7d68c59475d",
      "href": "urn:ngsi-ld:product-offering:3383068b-3671-4654-ba3c-f7d68c59475d",
      "lastUpdate": "2024-09-06T07:20:06.900138708Z",
      "lifecycleStatus": "ACTIVE",
      "name": "Ceres Robot Picture Offering",
      "version": "1.0.0",
      "productSpecification": {
         "id": "urn:ngsi-ld:product-specification:3a440f55-49ac-46be-afb3-504704ac6f21",
         "href": "urn:ngsi-ld:product-specification:3a440f55-49ac-46be-afb3-504704ac6f21",
         "name": "Ceres Robot Picture",
         "version": "1.0.0"
      }
   }
]
```

#### Measured results

As demonstrated above, the TM Forum API provided by FIWARE can be used to publish an offering by the provider. A consumer can query the contents of the catalog. This process makes the data product available in the catalog.

Based on the criteria outlined in the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section of the test description, the test is assigned the following score: **Functional Suitability Quality Metric: 4**

#### Notes

The endpoints to add offerings into the catalog are currently not secured. In the test setup, it is assumed, that the catalog is running inside the provider network. However, if the catalog would run on a central infrastructure, then these endpoints would have to be secured. This could be done by using the Apache APISIX gateway and securing the catalog endpoints with the same means as any other service or offering is secured. But this is outside the scope of this test.
