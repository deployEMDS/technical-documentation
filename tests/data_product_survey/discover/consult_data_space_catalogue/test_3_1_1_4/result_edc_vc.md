## [3.1.1.4] Data Product Survey: Discover - Consult Data Space Catalogue

### Stack: EDC+VC

### Statement of assessment

#### Environment

- The test utilizes the EDC MVD commit [8da0c4e](https://github.com/eclipse-edc/MinimumViableDataspace/commit/8da0c4e6a8921dcb6ff189c2901868979bdc9a93).
- EDC version [0.8.2-SNAPSHOT](https://github.com/eclipse-edc/MinimumViableDataspace/blob/8da0c4e6a8921dcb6ff189c2901868979bdc9a93/gradle/libs.versions.toml#L7).
- The test is executed in an Ubuntu environment using IntelliJ.

#### Tested quality metric and method

The test quality is evaluated based on the metrics defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).\
For the current phase (Phase 1), the test focuses on the Functional Suitability quality metric.

#### Comparative criteria (checklists, ...)

[TODO] Describe the comparative criteria used for the test/assessment. If possible, align with the criteria used for the same test in other stack(s).

#### Expected output

The test aims to determine whether the data product specification provides the necessary metadata for quality reporting or if the catalog needs to be extended with an "-AP" profile, with the former being ranked higher. The system may offer varying levels of support for Napcore's DCAT-AP profile, such as [MobilityDCAT-AP](https://mobilitydcat-ap.github.io/mobilityDCAT-AP/releases/index.html) profiles. The evaluation focuses on the level of support for the Napcore Profile and its vocabulary.

The ranking criteria are as follows:

- The implementation fully integrates Napcore's DCAT-AP profile and utilizes it for search and listing functions.
- The implementation does not incorporate Napcore's DCAT-AP extensions but still functions correctly, with extended metadata retrievable as part of the distribution.
- The implementation fails when Napcore's DCAT-AP is used to describe data products.
- The implementation does not support any DCAT-AP.
- The implementation supports the use of external vocabularies, such as Vocab-DQV.

### Results

#### Assessment

##### Napcore's DCAT-AP

[MobilityDCAT-AP](https://mobilitydcat-ap.github.io/mobilityDCAT-AP/releases/index.html) employs ontologies from [Vocab-DQV (namespace: dqv)](https://www.w3.org/TR/vocab-dqv/) and [Web Annotation Vocabulary (namespace: oa)](https://www.w3.org/TR/annotation-vocab/) to describe quality annotations to the dataset. The ontologies used in the MobilityDCAT-AP are:

- `dqv:QualityAnnotation`
- `dqv:hasQualityAnnotation`
- `oa:hasBody`
- `oa:hasTarget`

Please refer to the specification for the detailed data model and cardinality between the ontologies.

Quality Annotation is an OPTIONAL part of [MobilityDCAT-AP](https://mobilitydcat-ap.github.io/mobilityDCAT-AP/releases/index.html), which means that not including a quality annotation will not cause the conformity check of the AP to fail.

##### EDC Implementation

As stated in the [test_2_2_3_1a](../../../../data_product_publication/publication/publication_on_emds_catalogue/test_2_2_3_1a/result_edc_vc.md), EDC provides an open-box process for publishing a data product (data asset along with its policies and contract). This process makes the data product available in the connector catalog or the federated catalog. The content of the catalog's return value can be extended, for example, with quality annotations.

The quality feature of the sample dataset `deployEMDS-catalog-test` can be posted to the asset management endpoint `{{connector-management-endpoint}}/api/management/v3/assets` with the following payload:

```json
{
  "@context": {
    "dqv": "http://www.w3.org/ns/dqv#",
    "oa": "https://www.w3.org/TR/annotation-vocab/#"
  },
  "@id": "deployEMDS-catalog-test",
  "@type": "Asset",
  "properties": {
    "description": "This is an EMDS MB DCAT profile test asset",
    "dqv:hasQualityAnnotation": {
      "@id": "https://deployemds.eu/emdsQuality",
      "@type": "dqv:QualityAnnotation",
      "oa:hasBody": "https://deployemds.eu/post1",
      "hasTarget": "deployEMDS-catalog-test"
    }
  },
  "dataAddress": {
    "@type": "DataAddress",
    "type": "HttpData",
    "baseUrl": "https://jsonplaceholder.typicode.com/todos",
    "proxyPath": "true",
    "proxyQueryParams": "true"
  }
}
```

When querying the endpoint of the catalog, we get that quality information in the metadata:

```json
{
  "@id": "d0010d23-99be-48b3-ba52-cfcfbea4a171",
  "@type": "dcat:Catalog",
  "dcat:dataset": [
    {
      "@id": "deployEMDS-catalog-test",
      "@type": "dcat:Dataset",
      "odrl:hasPolicy": {
        "@id": "bWVtYmVyc2hpcC1yZXF1aXJlZC1kZWYxLTE=:bWItY2F0YWxvZy10ZXN0:NGYyYWY2ZjItYzZmNi00NjVhLTkwZWYtMGE0YzFlNTBkNTgy",
        "@type": "odrl:Offer",
        "odrl:permission": {
          "odrl:action": {
            "@id": "use"
          },
          "odrl:constraint": {
            "odrl:leftOperand": {
              "@id": "MembershipCredential"
            },
            "odrl:operator": {
              "@id": "odrl:eq"
            },
            "odrl:rightOperand": "active"
          }
        },
        "odrl:prohibition": [],
        "odrl:obligation": []
      },
      "dcat:distribution": [],
      "http://www.w3.org/ns/dqv#hasQualityAnnotation": {
        "@id": "https://deployemds.eu/emdsQuality",
        "@type": "http://www.w3.org/ns/dqv#QualityAnnotation",
        "https://www.w3.org/TR/annotation-vocab/#hasBody": "https://deployemds.eu/post1",
        "https://www.w3.org/TR/annotation-vocab/#hasTarget": "deployEMDS-catalog-test"
      },
      "description": "This is an EMDS MB DCAT profile test asset",
      "id": "deployEMDS-catalog-test"
    }
  ],
  "dcat:distribution": [],
  "dcat:service": {
    "@id": "c0e5f62c-3324-4cd8-b963-b1d1fa543f83",
    "@type": "dcat:DataService",
    "dcat:endpointDescription": "dspace:connector",
    "dcat:endpointUrl": "http://localhost:8092/api/dsp",
    "dct:terms": "dspace:connector",
    "dct:endpointUrl": "http://localhost:8092/api/dsp"
  },
  "dspace:participantId": "did:web:localhost%3A7093",
  "participantId": "did:web:localhost%3A7093",
  "@context": {
    "@vocab": "https://w3id.org/edc/v0.0.1/ns/",
    "edc": "https://w3id.org/edc/v0.0.1/ns/",
    "dcat": "http://www.w3.org/ns/dcat#",
    "dct": "http://purl.org/dc/terms/",
    "odrl": "http://www.w3.org/ns/odrl/2/",
    "dspace": "https://w3id.org/dspace/v0.8/"
  }
}
```

#### Measured results

As demonstrated, the catalog returned by the EDC connector's querying endpoint conforms to the [MobilityDCAT-AP](https://mobilitydcat-ap.github.io/mobilityDCAT-AP/releases/index.html) standard from a quality annotation perspective. Therefore, the following score is assigned to the test:

**Functional Suitability Quality Metric: 4**

#### Notes

- The EDC ecosystem primarily targets Java/Kotlin developers. Some extensions are available on the market for plug-and-play solutions, but for certain specific use cases, developers need to write their own extensions.

