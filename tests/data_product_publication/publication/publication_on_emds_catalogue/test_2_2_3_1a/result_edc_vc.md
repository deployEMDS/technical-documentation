## [2.2.3.1A] Data product publication: Publication - Publication on EMDS catalogue
### Stack: EDC+VC
### Statement of assessment
#### Environment
- The test utilizes the EDC MVD commit [9a5f93c](https://github.com/eclipse-edc/MinimumViableDataspace/commit/9a5f93c89cf5624cc4bf8eaa024a29da9b8e3d12).
- EDC version [0.8.1-snapshot](https://github.com/eclipse-edc/MinimumViableDataspace/blob/9a5f93c89cf5624cc4bf8eaa024a29da9b8e3d12/gradle/libs.versions.toml#L7) 
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
EDC does not provide an endpoint to publish a catalog directly. The process involves a series of API calls to publish an asset, a policy, and a contract. EDC then extracts this information and dynamically builds a catalog when a request is made.
Therefore, publishing a data asset along with its policy and contract will result in the publication of a catalog. The current test case examines the execution of this publication by querying the catalog endpoints as follows:
##### Connector Catalogue
With the [seed.sh](https://github.com/eclipse-edc/MinimumViableDataspace/blob/main/seed.sh) script, data products (data assets along with their contracts and policies) are published to the provider connector.

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

EDC provides a ready-to-use [Federated Catalog Solution](https://github.com/eclipse-edc/FederatedCatalog). This solution employs a set number of crawlers to periodically scan the dataspace, request catalogs from each participant in a predefined list, and consolidate them into a local cache. The federated catalog also offers [API endpoints](https://github.com/eclipse-edc/FederatedCatalog/blob/gh-pages/openapi/management-api/0.8.1-SNAPSHOT/management-api.yaml) for querying the catalogs.

The Minimum Viable Dataspace (MVD) uses an extension called [catalog-node-resolver](https://github.com/eclipse-edc/MinimumViableDataspace/tree/main/extensions/catalog-node-resolver) to identify the catalog access points (DSP) of participants in the data space and to crawl these points.

The API for the Federated Catalog is accessible via the following configurations:

```text
WEB_HTTP_CATALOG_PORT=8084
WEB_HTTP_CATALOG_PATH="/api/catalog"
```

A sample query to the Federated Catalog endpoint with these configurations is shown below:

```sh
curl --location 'http://localhost:8084/api/catalog/v1alpha/catalog/query' \
--header 'Content-Type: application/json' \
--header 'X-Api-Key: password' \
--data-raw '{
    "@context": {
        "edc": "https://w3id.org/edc/v0.0.1/ns/"
    },
    "@type": "QuerySpec"
}'
```

The response will be:

```json
[
    {
        "@id": "1570ac7c-3d79-4993-96f9-c1450a8f927b",
        "@type": "dcat:Catalog",
        "dcat:dataset": [
            {
                "@id": "normal-asset-1",
                "@type": "dcat:Dataset",
                "odrl:hasPolicy": {
                    "@id": "bWVtYmVyc2hpcC1yZXF1aXJlZC1kZWY=:bm9ybWFsLWFzc2V0LTE=:YmQ5MzM3MjMtYjE4NC00MzY3LTgyYjMtYzEyMDUwMjM2MjRm",
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
                "description": "This is a conventional asset, not a CatalogAsset.",
                "id": "normal-asset-1"
            },
            {
                "@id": "b36beb54-f22f-4ca8-a370-a6fd7f5851d9",
                "@type": "dcat:Catalog",
                "dcat:dataset": [
                    {
                        "@id": "asset-2",
                        "@type": "dcat:Dataset",
                        "odrl:hasPolicy": {
                            "@id": "c2Vuc2l0aXZlLW9ubHktZGVm:YXNzZXQtMg==:NWRkZjQwYjEtZTMyYi00NTI5LWI0MGQtZjhhOTcwOGQ1MzIw",
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
                                    "@id": "6accb72a-307e-46a4-a233-50b5ca40dec4",
                                    "@type": "dcat:DataService"
                                }
                            },
                            {
                                "@type": "dcat:Distribution",
                                "dct:format": {
                                    "@id": "HttpData-PUSH"
                                },
                                "dcat:accessService": {
                                    "@id": "6accb72a-307e-46a4-a233-50b5ca40dec4",
                                    "@type": "dcat:DataService"
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
                            "@id": "bWVtYmVyLWFuZC1kYXRhcHJvY2Vzc29yLWRlZg==:YXNzZXQtMQ==:MDMwYWE4MTMtOTg5NC00MDlmLWJlZjAtY2UyYTdlOWQ1NTcw",
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
                                    "@id": "6accb72a-307e-46a4-a233-50b5ca40dec4",
                                    "@type": "dcat:DataService"
                                }
                            },
                            {
                                "@type": "dcat:Distribution",
                                "dct:format": {
                                    "@id": "HttpData-PUSH"
                                },
                                "dcat:accessService": {
                                    "@id": "6accb72a-307e-46a4-a233-50b5ca40dec4",
                                    "@type": "dcat:DataService"
                                }
                            }
                        ],
                        "description": "This asset requires Membership to view and negotiate.",
                        "id": "asset-1"
                    }
                ],
                "dcat:distribution": [],
                "dcat:service": {
                    "@id": "6accb72a-307e-46a4-a233-50b5ca40dec4",
                    "@type": "dcat:DataService",
                    "dcat:endpointDescription": "dspace:connector",
                    "dcat:endpointUrl": "http://localhost:8192/api/dsp",
                    "dct:terms": "dspace:connector",
                    "dct:endpointUrl": "http://localhost:8192/api/dsp"
                },
                "dspace:participantId": "did:web:localhost%3A7093",
                "participantId": "did:web:localhost%3A7093"
            },
            {
                "@id": "17d40b4c-a011-409b-9e8f-aa4a04100fbf",
                "@type": "dcat:Catalog",
                "dcat:dataset": [
                    {
                        "@id": "asset-2",
                        "@type": "dcat:Dataset",
                        "odrl:hasPolicy": {
                            "@id": "c2Vuc2l0aXZlLW9ubHktZGVm:YXNzZXQtMg==:YjBjNGE3OWMtMzljMy00MjYyLWIxODgtZDdiZWMyOTgwMzQ5",
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
                                    "@id": "2c695ad0-7f9b-4919-a6be-580c8e659e48",
                                    "@type": "dcat:DataService"
                                }
                            },
                            {
                                "@type": "dcat:Distribution",
                                "dct:format": {
                                    "@id": "HttpData-PUSH"
                                },
                                "dcat:accessService": {
                                    "@id": "2c695ad0-7f9b-4919-a6be-580c8e659e48",
                                    "@type": "dcat:DataService"
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
                            "@id": "bWVtYmVyLWFuZC1kYXRhcHJvY2Vzc29yLWRlZg==:YXNzZXQtMQ==:N2MxOTY0ZDgtODQ1Zi00YmE0LTliMDQtZWFjYWQ4ZjU3OTNj",
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
                                    "@id": "2c695ad0-7f9b-4919-a6be-580c8e659e48",
                                    "@type": "dcat:DataService"
                                }
                            },
                            {
                                "@type": "dcat:Distribution",
                                "dct:format": {
                                    "@id": "HttpData-PUSH"
                                },
                                "dcat:accessService": {
                                    "@id": "2c695ad0-7f9b-4919-a6be-580c8e659e48",
                                    "@type": "dcat:DataService"
                                }
                            }
                        ],
                        "description": "This asset requires Membership to view and negotiate.",
                        "id": "asset-1"
                    }
                ],
                "dcat:distribution": [],
                "dcat:service": {
                    "@id": "2c695ad0-7f9b-4919-a6be-580c8e659e48",
                    "@type": "dcat:DataService",
                    "dcat:endpointDescription": "dspace:connector",
                    "dcat:endpointUrl": "http://localhost:8292/api/dsp",
                    "dct:terms": "dspace:connector",
                    "dct:endpointUrl": "http://localhost:8292/api/dsp"
                },
                "dspace:participantId": "did:web:localhost%3A7093",
                "participantId": "did:web:localhost%3A7093"
            }
        ],
        "dcat:distribution": [],
        "dcat:service": {
            "@id": "03fc2fe8-ea5d-424e-83fe-4bd1f8c20a45",
            "@type": "dcat:DataService",
            "dcat:endpointDescription": "dspace:connector",
            "dcat:endpointUrl": "http://localhost:8092/api/dsp",
            "dct:terms": "dspace:connector",
            "dct:endpointUrl": "http://localhost:8092/api/dsp"
        },
        "dspace:participantId": "did:web:localhost%3A7093",
        "originator": "http://localhost:8092/api/dsp",
        "participantId": "did:web:localhost%3A7093",
        "@context": {
            "@vocab": "https://w3id.org/edc/v0.0.1/ns/",
            "edc": "https://w3id.org/edc/v0.0.1/ns/",
            "odrl": "http://www.w3.org/ns/odrl/2/",
            "dcat": "http://www.w3.org/ns/dcat#",
            "dct": "http://purl.org/dc/terms/",
            "dspace": "https://w3id.org/dspace/v0.8/"
        }
    }
]
```
##### Policies on Catalog
As demonstrated in the EDC MVD commit [9a5f93c](https://github.com/eclipse-edc/MinimumViableDataspace/commit/9a5f93c89cf5624cc4bf8eaa024a29da9b8e3d12), access control can also be enforced on the view catalog scope. In the [MVD implementation](https://github.com/eclipse-edc/MinimumViableDataspace?tab=readme-ov-file#33-access-control), catalog requests require the presentation of a MembershipCredential. For more details on the implementation, please refer to [this file](https://github.com/eclipse-edc/MinimumViableDataspace/blob/main/extensions/dcp-impl/src/main/java/org/eclipse/edc/demo/dcp/policy/MembershipCredentialEvaluationFunction.java). Since catalog requests or Federated Catalogs are embedded inside a connector, the policy can be enforced by the connector identity.

#### Measured results
As demonstrated above, EDC provides an open-box process for publishing a data product (data asset along with its policies and contract). This process makes the data product available in the connector catalog or the federated catalog. Therefore, the following score is given to the test.

**Functional Suitability Quality Metric: 4**
#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to create their own extensions.