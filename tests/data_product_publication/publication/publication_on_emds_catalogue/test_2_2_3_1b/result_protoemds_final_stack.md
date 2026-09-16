## [2.2.3.1B] Data product publication: Publication - Publication on EMDS catalogue

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
| Existing test ID | `2.2.3.1B` |
| Level | UC + Technical |
| ISO/IEC 25010 mapping | Functional suitability, Compatibility |
| Owner | Casper (imec, @vghelu49) |
| Reviewer | Alessio |
| Deployment model assessed | CaaS / IONOS-managed deployment |
| Target environment | IONOS-managed CaaS deployment |
| EDC version / release | `emds-edc-connector` `9916cc5`, based on Eclipse EDC `0.10.0` |
| Connector deployment reference | `deployEMDS-k8s-deployment`, branch `prepare-prod`, commit `846e5f1` |
| Assessment evidence | Bruno CLI API execution |

The assessment should be completed using the deployment model for which evidence is realistically available. It is not mandatory to execute the same test in both CaaS and on-premise environments.

The deployment models are assessed independently. The CaaS assessment is
complete. The on-premise assessment remains `TBD`.

#### Tested quality metric and method

This result reuses the existing stack-agnostic test definition in `test.md` and adds a protoEMDS Final Stack integration-assessment perspective.

It does not replace the historical stack-specific result files, such as `result_edc_vc.md` or `result_fiware.md`.

The quality metric, expected output and comparative criteria remain those defined by the original test. This result file should only capture the evidence and assessment outcome for the selected protoEMDS Final Stack deployment.

#### Test-specific assessment scope

Test the process of catalogue publication for a data product under the following conditions: an existing data product is published on the catalogue

#### Expected Output

Test the process of catalogue publication for a data product under the following conditions: an existing data product is published on the catalogue
The EMDS catalog, as defined in the relevant documentation, refers to the Data Space-only catalog, specifically the internal EDC catalog and its federation component.

### Results

#### Assessment

Pass.

The asset was created first, without a policy or contract definition, and did
not appear in the consumer catalogue. After adding the policy and contract
definition, the same asset appeared with its metadata, policy offer, and
data-service distributions.

#### Deployment model assessed

| Deployment model | Status | Evidence | Consolidated assessment |
| --- | --- | --- | --- |
| CaaS / IONOS-managed deployment | Pass | Bruno CLI API execution | Existing asset was absent before publication and visible after its policy and contract definition were created. |
| On-premise deployment | TBD | TBD | To be assessed separately. |

#### Measured results

| Criteria | Measured KPI | Evidence | Notes |
| --- | ---: | --- | --- |
| **No Coverage:** No technical requirements are met. The solution fails to provide any functionality for an existing data product published in the catalog. | Not selected | API execution | Publication succeeded. |
| **Minimal Coverage:** Up to 25% of the technical requirements are met. Only basic functionalities are implemented, leaving most requirements unaddressed. | Not selected | API execution | Publication succeeded without the limitations described by this level. |
| **Partial Coverage:** Approximately 50% of the technical requirements are met. Key functions are partially implemented, but several critical aspects are lacking. | Not selected | API execution | The complete test path succeeded. |
| **Significant Coverage:** About 80% of the technical requirements are met. Most functionalities work as expected, with only minor gaps needing improvement. | Not selected | API execution | No gap was observed in the scope of this test. |
| **Full Coverage:** All technical requirements are fully met. The solution provides a comprehensive, out-of-the-box solution for an existing data product published in the catalog. | **4** | API execution | The before/after catalogue checks prove that adding the policy and contract definition published an already existing asset. |

**Functional Suitability Quality Metric:** 4

The before-and-after queries show that an existing asset can be published by
adding its policy and contract definition. The asset did not need to be
recreated. This meets the Full Coverage criterion.

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

sequence:
  - request: Create Test Asset
    method: POST
    url: https://{{provider}}/api/management/v3/assets
    expected_status: 200
  - request: Query Test Catalogue
    method: POST
    url: https://{{consumer}}/api/management/v3/catalog/request
    variables:
      expect-asset-present: "false"
    expected_status: 200
  - request: Create Test Policy
    method: POST
    url: https://{{provider}}/api/management/v3/policydefinitions
    expected_status: 200
  - request: Create Test Contract Definition
    method: POST
    url: https://{{provider}}/api/management/v3/contractdefinitions
    expected_status: 200
  - request: Query Test Catalogue
    method: POST
    url: https://{{consumer}}/api/management/v3/catalog/request
    variables:
      expect-asset-present: "true"
    expected_status: 200
```

The catalogue assertion used for both queries was:

```javascript
const response = res.getBody()
const datasets = Array.isArray(response["dcat:dataset"])
  ? response["dcat:dataset"]
  : [response["dcat:dataset"]].filter(Boolean)
const assetId = bru.getEnvVar("asset-id") || bru.getVar("asset-id")
const expectedPresent =
  String(bru.getEnvVar("expect-asset-present") || "true") === "true"
const found = datasets.some(item =>
  item["@id"] === assetId || item.id === assetId
)

if (res.getStatus() !== 200) {
  throw new Error(`Catalogue request failed with HTTP ${res.getStatus()}`)
}

if (found !== expectedPresent) {
  throw new Error("Catalogue presence did not match the expected state")
}
```

The relevant before-and-after response excerpts were:

```json
{
  "before_publication": {
    "dcat:dataset": []
  },
  "after_publication": {
    "dcat:dataset": [
      {
        "@id": "fla01-cat-test-asset-01",
        "dct:title": "Flanders catalogue integration test"
      }
    ]
  }
}
```

| Evidence | Sanitized observation |
| --- | --- |
| API-01 | The asset was created before publication configuration. |
| API-02 | The first catalogue query confirmed the asset was absent. |
| API-03 | The second catalogue query confirmed the same asset was visible. |
| Scope | One provider-to-consumer path was assessed. |

#### Notes

This result introduces a **protoEMDS Final Stack** perspective for the existing test `2.2.3.1B` under the KPI1 area **Catalogue publication**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The score applies to the assessed CaaS deployment. The on-premise result
remains TBD for a separate assessment.
