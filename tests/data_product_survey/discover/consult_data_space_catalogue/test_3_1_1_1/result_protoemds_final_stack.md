## [3.1.1.1] Data product survey: Discover - Consult data space catalogue

### Stack: protoEMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

This section identifies the technical context in which the protoEMDS Final Stack assessment is performed.

| Field | Value |
| --- | --- |
| Assessment context | Integration phase assessment of the EMDS final technical infrastructure |
| Result perspective | `protoemds_final_stack` |
| Stack under assessment | protoEMDS Final Stack (EDC-based) |
| KPI1 area | Catalogue discovery / metadata |
| Existing test ID | `3.1.1.1` |
| Level | UC + Technical |
| ISO/IEC 25010 mapping | Functional suitability, Compatibility |
| Owner | Casper (imec, @vghelu49) |
| Reviewer | Carlos |
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

Assessment: If an Online U/X is natively available, evaluate individual search features. If the Data space catalogue exposes an API, assess the technical debt to integrate it with a data search tool that is representative for EU projects. Criteria are: Open Source, hosted solution or EU-driven project.

#### Expected Output

The test aims to determine whether a native online user experience (U/X) is available and evaluate individual search features. 
If the data space catalog exposes an API, the test assesses the technical effort required to integrate it with a data search tool representative of EU projects.
The criteria for evaluation include being open-source, a hosted solution, or part of an EU-driven project.

### Results

#### Assessment

The catalogue was queried through both the Management API and the connector
UI. The API returned `200 OK` with the expected dataset metadata and DSP
distributions. The UI accepted a counterparty DSP address and DID, listed the
available products, and displayed product and policy details.

The UI has no free-text search, metadata filters, or pagination controls. No
external search platform was connected during this test.

![Catalogue browser showing MobilityDCAT-AP metadata and quality information](./images/catalogue-browser-protoemds-final-stack.png)

The screenshot shows the catalogue browser with the counterparty address and
identifier fields, the catalogue action, published asset cards, and the
additional mobility-properties view for a selected asset.

#### Deployment model assessed

| Deployment model | Status | Evidence | Consolidated assessment |
| --- | --- | --- | --- |
| CaaS / IONOS-managed deployment | Assessed | Bruno CLI and Playwright | API and UI catalogue retrieval passed. Advanced search and external integration remain limitations. |
| On-premise deployment | TBD | TBD | To be assessed separately. |

#### Measured results

| **Criteria** | Measured KPI | Evidence | Notes |
| --- | ---: | --- | --- |
| **No Coverage:** The solution fails to provide a native online user experience (U/X), exposes no search features, and does not offer any integration with open-source solutions, hosted solutions, or EU-driven projects. | Not selected | API and UI execution | Both API and native UI catalogue retrieval are available. |
| **Minimal Coverage:** The solution meets up to 25% of the evaluation criteria. This might include a basic online user interface with limited functionality, minimal search features, or an API that is available but requires significant technical effort to integrate with any of the three types of solutions: open-source, hosted, or EU-driven projects. | Not selected | API and UI execution | The UI provides product browsing and detailed metadata, exceeding minimal coverage. |
| **Partial Coverage:** The solution satisfies approximately 50% of the evaluation criteria. This could involve a functional online user experience with some search features and an API that supports integration with at least one of the three types of solutions (open-source, hosted, or EU-driven projects) but requires moderate effort. | **2** | API and UI execution | The UI retrieves and displays catalogues and product details, while the DCAT JSON-LD API is usable by external tools. Free-text search, metadata filters, pagination, and a completed external integration were not demonstrated. |
| **Significant Coverage:** The solution covers about 80% of the evaluation criteria. This includes a well-developed online user experience with comprehensive search features, and an API that is well-documented and supports integration with two of the three types of solutions with minimal technical effort. | Not selected | UI inspection | Comprehensive search and two low-effort integrations were not demonstrated. |
| **Full Coverage:** The solution fully meets all evaluation criteria. This includes a fully developed native online user experience with advanced search features, and an API that seamlessly integrates with all three types of solutions (open-source, hosted, and EU-driven projects) with minimal or no technical effort. | Not selected | UI inspection | Advanced search and seamless integration with all three solution types were not demonstrated. |

**Functional Suitability Quality Metric:** 2

The deployment provides a working catalogue browser and a DCAT JSON-LD API,
but not the search features required for a higher score. Since no external
search integration was tested either, the result matches the Partial Coverage
criterion.

#### Execution and evidence

The evidence snippets use generic participant labels. Credentials, hostnames,
and participant-specific identifiers are omitted. Disposable test IDs are
retained to keep the workflow concrete.

**Sanitized Bruno catalogue query**

```yaml
variables:
  provider: "<provider-host>"
  consumer: "<consumer-host>"
  asset-id: "fla01-cat-test-asset-01"

request:
  method: POST
  url: https://{{consumer}}/api/management/v3/catalog/request
  body:
    "counterPartyAddress": "https://{{provider}}/api/dsp"
    "counterPartyId": "did:web:<provider-host>"
    "protocol": "dataspace-protocol-http"
    "querySpec":
      "offset": 0
      "limit": 100
```

The catalogue assertion was:

```javascript
const response = res.getBody()
const datasets = Array.isArray(response["dcat:dataset"])
  ? response["dcat:dataset"]
  : [response["dcat:dataset"]].filter(Boolean)
const assetId = bru.getEnvVar("asset-id") || bru.getVar("asset-id")
const dataset = datasets.find(item =>
  item["@id"] === assetId || item.id === assetId
)

if (res.getStatus() !== 200) {
  throw new Error(`Catalogue request failed with HTTP ${res.getStatus()}`)
}

if (!dataset) {
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

**Sanitized UI workflow**

```javascript
await page.goto("https://<connector-host>/dashboard/")
await page.getByRole("link", {name: "Catalog browser"}).click()
await page.getByLabel("Counterparty DSP address").fill(
  "https://<provider-host>/api/dsp"
)
await page.getByLabel("Counterparty DID").fill("did:web:<provider-host>")
await page.getByRole("button", {name: "Catalog"}).click()
await page.getByText("Flanders catalogue integration test").click()
```

| Evidence | Sanitized observation |
| --- | --- |
| API-01 | The consumer catalogue returned the expected dataset and distributions. |
| UI-01 | The native catalogue browser displayed product and policy details. |
| UI-02 | Free-text search, metadata filters, and pagination were absent. |
| Screenshot | [Catalogue browser screenshot](./images/catalogue-browser-protoemds-final-stack.png) |

#### Notes

This result introduces a **protoEMDS Final Stack** perspective for the existing test `3.1.1.1` under the KPI1 area **Catalogue discovery / metadata**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The score applies to the assessed CaaS deployment. The on-premise result
remains TBD for a separate assessment.
