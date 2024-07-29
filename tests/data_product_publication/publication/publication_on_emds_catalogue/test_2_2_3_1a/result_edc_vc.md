## [2.2.3.1A] Data product publication: Publication - Publication on EMDS catalogue
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
The test aims to examine the process of catalog publication for a data product under the following conditions: a new data product is added to the catalog. The EMDS catalog, as defined in the relevant documentation, 
refers to the Data Space-only catalog, specifically the internal EDC catalog and its federation component.

### Results
#### Assessment
EDC employs a few APIs for the publication of data products (assets), which have been explained in other test cases. It also provides endpoints for querying the catalog on connectors. Once a dataset is published on a connector of a data space, it can be queried using the following methods.
##### Connector Catalogue
The EDC MVD commit [9a5f93c](https://github.com/eclipse-edc/MinimumViableDataspace/commit/9a5f93c89cf5624cc4bf8eaa024a29da9b8e3d12) utilizes the connector's management API endpoint `{{connector}}/api/management/v3/catalog/request` to query the catalog on the `counterPartyAddress` connector. This endpoint returns the data product (asset) published on the `counterPartyAddress`.

A working example is as follows:
```sh
curl --location 'http://localhost:8081/api/management/v3/catalog/request' \
--header 'X-Api-Key: password' \
--header 'Content-Type: application/json' \
--data-raw '{
    "@context": {
        "edc": "https://w3id.org/edc/v0.0.1/ns/"
    },
    "@type": "CatalogRequest",
    "counterPartyAddress": "http://localhost:8192/api/dsp",
    "counterPartyId": "did:web:localhost%3A7093",
    "protocol": "dataspace-protocol-http",
    "querySpec": {
        "offset": 0,
        "limit": 50
    }
}'
```
This API call is initiated by a consumer connector, with its management API running at port 8081 on localhost. It queries the catalog of the provider connector, with the DSP endpoint of the provider connector at `http://localhost:8192/api/dsp`.

In the EDC system, the catalog on the provider connector is modeled as follows:
```json
{
    "@id": "cbe6b723-02cc-449a-8d35-d203f49083a4",
    "@type": "dcat:Catalog",
    "dcat:dataset": [
        {
            "@id": "asset-2",
            "@type": "dcat:Dataset",
            "odrl:hasPolicy": {
                "@id": "c2Vuc2l0aXZlLW9ubHktZGVm:YXNzZXQtMg==:MTVjMzdjNjktM2RjMy00YjUzLWFmZTktY2UwNGNkODk5ZmI4",
                "@type": "odrl:Offer",
                "odrl:permission": [],
                "odrl:prohibition": [],
                "odrl:obligation": {
                    "odrl:action": {
                        "@id": "use"
                    },
                    "odrl:constraint": {
                        "odrl:leftOperand": {
                            "@id": "DataAccess.level"
                        },
                        "odrl:operator": {
                            "@id": "odrl:eq"
                        },
                        "odrl:rightOperand": "sensitive"
                    }
                }
            },
            "dcat:distribution": [
                {
                    "@type": "dcat:Distribution",
                    "dct:format": {
                        "@id": "HttpData-PULL"
                    },
                    "dcat:accessService": {
                        "@id": "b7e9ea09-b22a-4e3e-a691-60a019ba9fab",
                        "@type": "dcat:DataService",
                        "dcat:endpointDescription": "dspace:connector",
                        "dcat:endpointUrl": "http://localhost:8192/api/dsp",
                        "dct:terms": "dspace:connector",
                        "dct:endpointUrl": "http://localhost:8192/api/dsp"
                    }
                },
                {
                    "@type": "dcat:Distribution",
                    "dct:format": {
                        "@id": "HttpData-PUSH"
                    },
                    "dcat:accessService": {
                        "@id": "b7e9ea09-b22a-4e3e-a691-60a019ba9fab",
                        "@type": "dcat:DataService",
                        "dcat:endpointDescription": "dspace:connector",
                        "dcat:endpointUrl": "http://localhost:8192/api/dsp",
                        "dct:terms": "dspace:connector",
                        "dct:endpointUrl": "http://localhost:8192/api/dsp"
                    }
                }
            ],
            "description": "This asset requires Membership to view and SensitiveData credential to negotiate.",
            "id": "asset-2"
        },
        {
            "@id": "asset-1",
            "@type": "dcat:Dataset",
            "odrl:hasPolicy": {
                "@id": "bWVtYmVyLWFuZC1kYXRhcHJvY2Vzc29yLWRlZg==:YXNzZXQtMQ==:N2QwZTdiNzEtYWNjMi00YTI5LWFmMDAtYzU5MWQxOTRkY2M5",
                "@type": "odrl:Offer",
                "odrl:permission": [],
                "odrl:prohibition": [],
                "odrl:obligation": {
                    "odrl:action": {
                        "@id": "use"
                    },
                    "odrl:constraint": {
                        "odrl:leftOperand": {
                            "@id": "DataAccess.level"
                        },
                        "odrl:operator": {
                            "@id": "odrl:eq"
                        },
                        "odrl:rightOperand": "processing"
                    }
                }
            },
            "dcat:distribution": [
                {
                    "@type": "dcat:Distribution",
                    "dct:format": {
                        "@id": "HttpData-PULL"
                    },
                    "dcat:accessService": {
                        "@id": "b7e9ea09-b22a-4e3e-a691-60a019ba9fab",
                        "@type": "dcat:DataService",
                        "dcat:endpointDescription": "dspace:connector",
                        "dcat:endpointUrl": "http://localhost:8192/api/dsp",
                        "dct:terms": "dspace:connector",
                        "dct:endpointUrl": "http://localhost:8192/api/dsp"
                    }
                },
                {
                    "@type": "dcat:Distribution",
                    "dct:format": {
                        "@id": "HttpData-PUSH"
                    },
                    "dcat:accessService": {
                        "@id": "b7e9ea09-b22a-4e3e-a691-60a019ba9fab",
                        "@type": "dcat:DataService",
                        "dcat:endpointDescription": "dspace:connector",
                        "dcat:endpointUrl": "http://localhost:8192/api/dsp",
                        "dct:terms": "dspace:connector",
                        "dct:endpointUrl": "http://localhost:8192/api/dsp"
                    }
                }
            ],
            "description": "This asset requires Membership to view and negotiate.",
            "id": "asset-1"
        }
    ],
    "dcat:distribution": [],
    "dcat:service": {
        "@id": "b7e9ea09-b22a-4e3e-a691-60a019ba9fab",
        "@type": "dcat:DataService",
        "dcat:endpointDescription": "dspace:connector",
        "dcat:endpointUrl": "http://localhost:8192/api/dsp",
        "dct:terms": "dspace:connector",
        "dct:endpointUrl": "http://localhost:8192/api/dsp"
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

##### Federated Catalog
EDC offers an out-of-the-box [Federated Catalog Solution](https://github.com/eclipse-edc/FederatedCatalog). This solution uses a set number of crawlers to periodically scrape the dataspace, requesting catalogs from each participant in a predefined list and consolidating them into a local cache. The federated catalog also provides an [API endpoint(s)](https://github.com/eclipse-edc/FederatedCatalog/blob/gh-pages/openapi/management-api/0.8.1-SNAPSHOT/management-api.yaml) for querying the catalogs. Here’s an example of the output you can expect:
```json
[
  {
    "@id": "d5731b09-cd6b-4c04-bc49-a64ded95b6af",
    "@type": "http://www.w3.org/ns/dcat#Catalog",
    "https://w3id.org/dspace/v0.8/participantId": "provider",
    "http://www.w3.org/ns/dcat#dataset": {
      "@id": "ab11b34b-c48e-40f6-9729-81c1cf0716e9",
      "@type": "http://www.w3.org/ns/dcat#Dataset",
      "odrl:hasPolicy": {
        "@id": "MDI0MDE4NTktNGZjYi00NzllLWIxMDUtYmNjNTc4ODBhYjAy:YWIxMWIzNGItYzQ4ZS00MGY2LTk3MjktODFjMWNmMDcxNmU5:OTExYzhhMWUtNDRjNS00ZmFmLTg4ZDItNmU4NGYyNWEzNzY2",
        "@type": "odrl:Offer",
        "odrl:permission": [],
        "odrl:prohibition": [],
        "odrl:obligation": []
      },
      "http://www.w3.org/ns/dcat#distribution": [
        {
          "@type": "http://www.w3.org/ns/dcat#Distribution",
          "http://purl.org/dc/terms/format": {
            "@id": "HttpProxy-PUSH"
          },
          "http://www.w3.org/ns/dcat#accessService": "86f54d36-b23e-482f-89dc-9993389b45c7"
        },
        {
          "@type": "http://www.w3.org/ns/dcat#Distribution",
          "http://purl.org/dc/terms/format": {
            "@id": "HttpData-PUSH"
          },
          "http://www.w3.org/ns/dcat#accessService": "86f54d36-b23e-482f-89dc-9993389b45c7"
        },
        {
          "@type": "http://www.w3.org/ns/dcat#Distribution",
          "http://purl.org/dc/terms/format": {
            "@id": "sftp-PUSH"
          },
          "http://www.w3.org/ns/dcat#accessService": "86f54d36-b23e-482f-89dc-9993389b45c7"
        }
      ],
      "name": "product description",
      "id": "ab11b34b-c48e-40f6-9729-81c1cf0716e9",
      "contenttype": "application/json"
    },
    "http://www.w3.org/ns/dcat#service": {
      "@id": "86f54d36-b23e-482f-89dc-9993389b45c7",
      "@type": "http://www.w3.org/ns/dcat#DataService",
      "http://purl.org/dc/terms/terms": "connector",
      "http://purl.org/dc/terms/endpointUrl": "http://provider:19194/protocol"
    },
    "originator": "http://localhost:19194/protocol",
    "participantId": "provider",
    "@context": {
      "@vocab": "https://w3id.org/edc/v0.0.1/ns/",
      "edc": "https://w3id.org/edc/v0.0.1/ns/",
      "odrl": "http://www.w3.org/ns/odrl/2/"
    }
  },
  {
    "@id": "c0375bb7-4f9f-4a18-9799-bcc7db61ac76",
    "@type": "http://www.w3.org/ns/dcat#Catalog",
    "https://w3id.org/dspace/v0.8/participantId": "consumer",
    "http://www.w3.org/ns/dcat#dataset": [],
    "http://www.w3.org/ns/dcat#service": {
      "@id": "06b14d00-c78b-4910-a28a-d876a2d1a784",
      "@type": "http://www.w3.org/ns/dcat#DataService",
      "http://purl.org/dc/terms/terms": "connector",
      "http://purl.org/dc/terms/endpointUrl": "http://consumer:29194/protocol"
    },
    "originator": "http://consumer:29194/protocol",
    "participantId": "consumer",
    "@context": {
      "@vocab": "https://w3id.org/edc/v0.0.1/ns/",
      "edc": "https://w3id.org/edc/v0.0.1/ns/",
      "odrl": "http://www.w3.org/ns/odrl/2/"
    }
  }
]
```
The Federated Catalog is not included in the EDC MVD commit [9a5f93c](https://github.com/eclipse-edc/MinimumViableDataspace/commit/9a5f93c89cf5624cc4bf8eaa024a29da9b8e3d12).

#### Measured results
As demonstrated above, EDC provides an open-box solution for querying the catalog on a single connector or the federated catalog of a data space once a dataset (data product) is published to the data space ecosystem.

**Functional Suitability Quality Metric: 4**
#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to create their own extensions.