## [2.2.3.1A] Data product publication: Publication - Publication on EMDS catalogue

### Stack: protoEMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the protoEMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `protoemds_final_stack` |
| Stack under assessment | protoEMDS Final Stack (EDC-based) |
| KPI1 area | Catalogue publication |
| Existing test ID | `2.2.3.1A` |
| Level | UC + Technical |
| ISO/IEC 25010 mapping | Functional suitability, Compatibility |
| Owner | Casper (imec, @vghelu49) |
| Reviewer | Alessio |
| Deployment model assessed | CaaS / IONOS-managed deployment |
| Target environment | IONOS-managed CaaS deployment |
| EDC version / release | `emds-edc-connector` `9916cc5`, based on Eclipse EDC `0.10.0` |
| Connector deployment reference | `deployEMDS-k8s-deployment`, branch `prepare-prod`, commit `846e5f1` |
| Assessment evidence | Bruno CLI API execution and Playwright UI verification |

The assessment should be completed using the deployment model for which evidence is realistically available. It is not mandatory to execute the same test in both CaaS and on-premise environments.

The deployment models are assessed independently. The CaaS assessment is
complete. The on-premise assessment remains `TBD`.

#### Tested quality metric and method

This result reuses the existing stack-agnostic test definition in `test.md` and adds a protoEMDS Final Stack integration-assessment perspective.

It does not replace the historical stack-specific result files, such as `result_edc_vc.md` or `result_fiware.md`.

The quality metric, expected output and comparative criteria remain those defined by the original test. This result file should only capture the evidence and assessment outcome for the selected protoEMDS Final Stack deployment.

#### Test-specific assessment scope

Test the process of catalogue publication for a data product under the following conditions: a new data product is published in the catalogue

#### Expected Output

The test aims to examine the process of catalog publication for a data product under the following conditions: a new data product is added to the catalog. The EMDS catalog, as defined in the relevant documentation,
refers to the Data Space-only catalog, specifically the internal EDC catalog and its federation component.

### Results

#### Assessment

Pass.

A new asset, policy, and contract definition were created through the
provider's Management API. A catalogue request from the consumer returned
`200 OK` and included the product with its expected metadata, DSP endpoint,
and `HttpData-PULL` and `HttpData-PUSH` distributions.

#### Deployment model assessed

| Deployment model | Status | Evidence | Consolidated assessment |
| --- | --- | --- | --- |
| CaaS / IONOS-managed deployment | Pass | Bruno CLI output | New test product was visible from the consumer catalogue. |
| On-premise deployment | TBD | TBD | To be assessed separately. |

#### Measured results

| Criteria | Measured KPI | Evidence | Notes |
| --- | ---: | --- | --- |
| **No Coverage:** No technical requirements are met. The solution fails to provide any functionality for the new data product in the catalog. | Not selected | API and UI execution | Publication succeeded. |
| **Minimal Coverage:** Up to 25% of the technical requirements are met. Only basic functionalities are implemented, leaving most requirements unaddressed. | Not selected | API and UI execution | Publication succeeded without the limitations described by this level. |
| **Partial Coverage:** Approximately 50% of the technical requirements are met. Key functions are partially implemented, but several critical aspects are lacking. | Not selected | API and UI execution | The complete test path succeeded. |
| **Significant Coverage:** About 80% of the technical requirements are met. Most functionalities work as expected, with only minor gaps needing improvement. | Not selected | API and UI execution | No gap was observed in the scope of this test. |
| **Full Coverage:** All technical requirements are fully met. The solution provides a comprehensive, out-of-the-box solution for the new data product in the catalog. | **4** | API and UI execution | Asset, policy, and contract creation returned `200 OK`. The consumer catalogue returned the new product with the expected metadata and distributions. |

**Functional Suitability Quality Metric:** 4

The standard Management API covered the complete publication path without
custom changes. The catalogue response confirmed that the consumer could see
the new product, so this test meets the Full Coverage criterion.

#### Execution and evidence

The evidence snippets use generic participant labels. Credentials, hostnames,
and participant-specific identifiers are omitted. Disposable test IDs are
retained to keep the workflow concrete.

**Sanitized Bruno workflow**

```yaml
variables:
  provider: "<provider-host>"
  consumer: "<consumer-host>"
  asset-id: "fla01-cat-test-asset-01"
  policy-id: "fla01-cat-test-policy-01"
  contract-id: "fla01-cat-test-contract-01"

requests:
  - name: Create Test Asset
    method: POST
    url: https://{{provider}}/api/management/v3/assets
    expected_status: 200
    body:
      "@id": "{{asset-id}}"
      "properties":
        "dct:title": "Flanders catalogue integration test"
        "dct:description": "Disposable test asset"
        "dct:publisher":
          "foaf:name": "Test provider"
        "mobilitydcatap:mobilityTheme": "<mobility-theme>"
        "dqv:hasQualityAnnotation": "<quality-annotation>"
      "dataAddress":
        "edc:type": "HttpData"
        "edc:baseUrl": "<test-data-endpoint>"

  - name: Create Test Policy
    method: POST
    url: https://{{provider}}/api/management/v3/policydefinitions
    expected_status: 200
    body:
      "@id": "{{policy-id}}"
      "policy":
        "@type": "odrl:Set"
        "permission": []
        "prohibition": []
        "obligation": []

  - name: Create Test Contract Definition
    method: POST
    url: https://{{provider}}/api/management/v3/contractdefinitions
    expected_status: 200
    body:
      "@id": "{{contract-id}}"
      "accessPolicyId": "{{policy-id}}"
      "contractPolicyId": "{{policy-id}}"
      "assetsSelector":
        "operandLeft": "https://w3id.org/edc/v0.0.1/ns/id"
        "operator": "="
        "operandRight": "{{asset-id}}"

  - name: Query Test Catalogue
    method: POST
    url: https://{{consumer}}/api/management/v3/catalog/request
    expected_status: 200
    body:
      "counterPartyAddress": "https://{{provider}}/api/dsp"
      "counterPartyId": "did:web:<provider-host>"
      "protocol": "dataspace-protocol-http"
      "querySpec":
        "offset": 0
        "limit": 100
```

The catalogue assertion used after the final request was:

```javascript
const response = res.getBody()
const datasets = Array.isArray(response["dcat:dataset"])
  ? response["dcat:dataset"]
  : [response["dcat:dataset"]].filter(Boolean)
const assetId = bru.getEnvVar("asset-id") || bru.getVar("asset-id")

if (res.getStatus() !== 200) {
  throw new Error(`Catalogue request failed with HTTP ${res.getStatus()}`)
}

if (!datasets.some(item => item["@id"] === assetId || item.id === assetId)) {
  throw new Error("Expected test asset is absent from the catalogue")
}
```

The relevant catalogue response excerpt was:

```json
{
  "dcat:dataset": [
    {
      "@id": "fla01-cat-test-asset-01",
      "dct:title": "Flanders catalogue integration test",
      "dcat:distribution": [
        {
          "@type": "dcat:Distribution",
          "dct:format": {
            "@id": "HttpData-PULL"
          }
        }
      ]
    }
  ]
}
```

| Evidence | Sanitized observation |
| --- | --- |
| API-01 | Asset, policy, and contract creation returned `200 OK`. |
| API-02 | The consumer catalogue returned the expected dataset. |
| Scope | One provider-to-consumer path was assessed. |

#### Notes

This result introduces a **protoEMDS Final Stack** perspective for the existing test `2.2.3.1A` under the KPI1 area **Catalogue publication**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The score applies to the assessed CaaS deployment. The on-premise result
remains TBD for a separate assessment.
