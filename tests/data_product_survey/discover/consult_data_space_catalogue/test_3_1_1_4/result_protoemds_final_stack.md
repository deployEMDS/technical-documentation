## [3.1.1.4] Data product survey: Discover - Consult data space catalogue

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
| Existing test ID | `3.1.1.4` |
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

Assessment: either the data product specification provides the necessary metadata to report quality, or the catalogue must be extended with an “-AP” profile. Ranks higher in the first case.

#### Expected Output

The test aims to determine whether the data product specification provides the necessary metadata for quality reporting or if the catalog needs to be extended with an "-AP" profile, with the former being ranked higher. The system may offer varying levels of support for Napcore's DCAT-AP profile, such as [MobilityDCAT-AP](https://mobilitydcat-ap.github.io/mobilityDCAT-AP/releases/index.html) profiles. The evaluation focuses on the level of support for the Napcore Profile and its vocabulary.

### Results

#### Assessment

The test product included standard DCAT metadata, a MobilityDCAT-AP mobility
theme, and a DQV quality annotation using
`dqv:hasQualityAnnotation`, `dqv:QualityAnnotation`, `oa:hasBody`, and
`oa:hasTarget`.

The consumer catalogue returned `200 OK` and preserved the product title,
MobilityDCAT-AP theme, and DQV quality annotation. In the native catalogue
browser, the product detail view rendered spatial coverage and mobility theme
and mapped the quality annotation into its **Quality Description** field. The
same UI provides fields for further MobilityDCAT-AP metadata such as
georeferencing method, network coverage, reference system, rights holder,
transport mode, applicable legislation, assessment result, and intended
information service.

The catalogue browser does not offer quality-based search or filtering. The
API preserved the annotation body and target, but the UI did not display them
as separate fields.

![Catalogue view showing MobilityDCAT-AP and quality metadata](./images/catalogue-browser-protoemds-final-stack.png)

The screenshot shows the selected asset's additional mobility-properties view.
The visible fields include georeferencing method, network coverage, reference
system, rights holder, transport mode, assessment result, intended information
service, and quality description.

#### Deployment model assessed

| Deployment model | Status | Evidence | Consolidated assessment |
| --- | --- | --- | --- |
| CaaS / IONOS-managed deployment | Pass with limitations | Bruno CLI and Playwright | Profile metadata is preserved and partly rendered. Profile-aware search is not available. |
| On-premise deployment | TBD | TBD | To be assessed separately. |

#### Measured results

| **Criteria** | Measured KPI | Evidence | Notes |
| --- | ---: | --- | --- |
| **No DCAT-AP Support:** The implementation does not allow any DCAT-AP profile or functionality. | Not selected | API and UI execution | MobilityDCAT-AP and DQV metadata were accepted. |
| **Breaks with Napcore DCAT-AP:** The implementation breaks if Napcore's DCAT-AP is used to describe data products. | Not selected | API and UI execution | Publication and catalogue retrieval remained functional. |
| **Ignores Extensions but Functional:** The implementation ignores the extensions of Napcore's DCAT-AP, but the system works as expected, with extended metadata retrievable as part of the distribution. | Not selected | API and UI execution | The UI actively renders several profile fields rather than only preserving them. |
| **Partial Integration:** The implementation integrates Napcore's DCAT-AP profile and utilizes it for some search and listing functionalities, but with limitations. | **3** | API and UI execution | Metadata and DQV quality information are preserved and partly rendered in product details, but profile-aware search/filtering and complete quality-annotation rendering are missing. |
| **Full Integration:** The implementation fully integrates Napcore's DCAT-AP profile and utilizes it effectively for search and listing functionalities. | Not selected | UI inspection | The assessed catalogue browser does not use profile fields for search or filtering. |

**Functional Suitability Quality Metric:** 3

The profile is more than pass-through metadata: the UI exposes
MobilityDCAT-AP fields and displays mobility and quality information in the
product details. Profile-aware search is missing, and not every part of the
DQV annotation is displayed, so the result matches Partial Integration.

#### Execution and evidence

The evidence snippets use generic participant labels. Credentials, hostnames,
and participant-specific identifiers are omitted. Disposable test IDs are
retained to keep the workflow concrete.

**Sanitized Bruno metadata query**

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

The metadata assertions were:

```javascript
const response = res.getBody()
const datasets = Array.isArray(response["dcat:dataset"])
  ? response["dcat:dataset"]
  : [response["dcat:dataset"]].filter(Boolean)
const assetId = bru.getEnvVar("asset-id") || bru.getVar("asset-id")
const dataset = datasets.find(item =>
  item["@id"] === assetId || item.id === assetId
)

if (res.getStatus() !== 200 || !dataset) {
  throw new Error("Expected catalogue dataset was not returned")
}

if (!dataset["dct:title"]) {
  throw new Error("Dataset title is missing")
}

if (!dataset["mobilitydcatap:mobilityTheme"]) {
  throw new Error("MobilityDCAT-AP theme is missing")
}

if (!dataset["dqv:hasQualityAnnotation"] &&
    !dataset["http://www.w3.org/ns/dqv#hasQualityAnnotation"]) {
  throw new Error("DQV quality annotation is missing")
}
```

The relevant catalogue response excerpt was:

```json
{
  "dcat:dataset": [
    {
      "@id": "fla01-cat-test-asset-01",
      "dct:title": "Flanders catalogue integration test",
      "mobilitydcatap:mobilityTheme": "https://w3id.org/mobilitydcat-ap/mobility-theme/other",
      "dqv:hasQualityAnnotation": {
        "@id": "urn:deployemds:quality:integration-test",
        "oa:hasBody": "urn:deployemds:quality:body:integration-test",
        "oa:hasTarget": "fla01-cat-test-asset-01"
      }
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
await page.getByRole("button", {name: "Additional Mobility Properties"}).click()
```

| Evidence | Sanitized observation |
| --- | --- |
| API-01 | DCAT metadata, MobilityDCAT-AP metadata, and DQV annotation were preserved. |
| UI-01 | Spatial and mobility metadata were rendered in the product view. |
| UI-02 | Quality information was mapped to the visible quality description. |
| UI-03 | Quality-based search and filtering were not available. |
| Screenshot | [Catalogue metadata screenshot](./images/catalogue-browser-protoemds-final-stack.png) |

#### Notes

This result introduces a **protoEMDS Final Stack** perspective for the existing test `3.1.1.4` under the KPI1 area **Catalogue discovery / metadata**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The score applies to the assessed CaaS deployment. The on-premise result
remains TBD for a separate assessment.
