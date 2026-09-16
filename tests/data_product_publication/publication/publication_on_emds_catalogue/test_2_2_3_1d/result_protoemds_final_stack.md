## [2.2.3.1D] Data product publication: Publication - Publication on EMDS catalogue

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
| Existing test ID | `2.2.3.1D` |
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

Test the process of catalogue publication for a data product under the following conditions: a data product is de-published.

#### Expected Output

The test aims to examine the process of catalog de-publication for a data product under the following conditions: a data product is removed (de-published) from the catalog. The EMDS catalog, as defined in the relevant documentation, refers to the Data Space-only catalog, specifically the internal EDC catalog and its federation component.

### Results

#### Assessment

Pass.

The product was visible before its contract definition was deleted. The delete
request returned `204 No Content`. The next catalogue query no longer included
the product, while a direct asset lookup still returned `200 OK`. The test
policy and asset were removed afterward.

#### Deployment model assessed

| Deployment model | Status | Evidence | Consolidated assessment |
| --- | --- | --- | --- |
| CaaS / IONOS-managed deployment | Pass | Bruno CLI API execution | Removing the contract definition removed catalogue visibility while retaining the asset. |
| On-premise deployment | TBD | TBD | To be assessed separately. |

#### Measured results

| **Criteria** | Measured KPI | Evidence | Notes |
| --- | ---: | --- | --- |
| **No Coverage:** The solution does not provide any functionality for de-publishing a data product from the catalog. Users cannot remove or hide a data product once it is published, and achieving this requires extensive custom development or workarounds. | Not selected | API execution | De-publication succeeded. |
| **Minimal Coverage:** The solution meets up to 25% of the evaluation criteria. It may offer basic de-publication functionality, but this is not fully operational out of the box and requires significant technical effort or development to implement. The process is cumbersome and not intuitive for end users. | Not selected | API execution | No custom development or workaround was required. |
| **Partial Coverage:** The solution satisfies approximately 50% of the evaluation criteria. It allows for de-publishing of data products but requires some degree of customization or development to function correctly. Additionally, the process may be partially intuitive but could still pose challenges for end users in terms of usability. | Not selected | API execution | The standard Management API operation was sufficient. |
| **Significant Coverage:** The solution covers about 80% of the evaluation criteria. It provides effective de-publication functionality with minimal development required. The de-publication process is mostly intuitive and user-friendly, with only minor usability issues or adjustments needed. | Not selected | API execution | No functional gap was observed in the tested API path. |
| **Full Coverage:** The solution fully meets all evaluation criteria. It offers complete, out-of-the-box functionality for de-publishing a data product, allowing users to easily remove or hide a data product from the catalog. The process is straightforward, intuitive, and requires no additional development or technical modifications. | **4** | API execution | A standard contract-definition deletion removed the offer from the catalogue and retained the underlying asset. |

**Functional Suitability Quality Metric:** 4

The standard Management API removed the offer from the catalogue without
custom development or deletion of the underlying asset. This meets the Full
Coverage criterion.

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
  - request: Query Test Catalogue
    method: POST
    url: https://{{consumer}}/api/management/v3/catalog/request
    variables:
      expect-asset-present: "true"
    expected_status: 200
  - request: Delete Test Contract Definition
    method: DELETE
    url: https://{{provider}}/api/management/v3/contractdefinitions/{{contract-id}}
    expected_status: 200 or 204
  - request: Query Test Catalogue
    method: POST
    url: https://{{consumer}}/api/management/v3/catalog/request
    variables:
      expect-asset-present: "false"
    expected_status: 200
  - request: Get Test Asset
    method: GET
    url: https://{{provider}}/api/management/v3/assets/{{asset-id}}
    expected_status: 200
  - request: Delete Test Policy
    method: DELETE
    url: https://{{provider}}/api/management/v3/policydefinitions/{{policy-id}}
    expected_status: 200 or 204
  - request: Delete Test Asset
    method: DELETE
    url: https://{{provider}}/api/management/v3/assets/{{asset-id}}
    expected_status: 200 or 204
```

The contract deletion assertion was:

```javascript
if (![200, 204].includes(res.getStatus())) {
  throw new Error(
    `Contract definition deletion failed with HTTP ${res.getStatus()}`
  )
}
```

The retained-asset assertion was:

```javascript
const response = res.getBody()
if (res.getStatus() !== 200) {
  throw new Error(`Asset lookup failed with HTTP ${res.getStatus()}`)
}

if (response["@id"] !== bru.getEnvVar("asset-id")) {
  throw new Error("Asset lookup returned a different asset")
}
```

The relevant response excerpts were:

```json
{
  "before_depublication": {
    "dcat:dataset": [
      {
        "@id": "fla01-cat-test-asset-01"
      }
    ]
  },
  "after_depublication": {
    "dcat:dataset": []
  },
  "retained_asset": {
    "@id": "fla01-cat-test-asset-01"
  }
}
```

| Evidence | Sanitized observation |
| --- | --- |
| API-01 | The product was present before contract-definition deletion. |
| API-02 | The deletion returned `204 No Content`. |
| API-03 | The product was absent afterward. |
| API-04 | The underlying asset remained available. |
| Scope | One disposable provider asset was used. |

#### Notes

This result introduces a **protoEMDS Final Stack** perspective for the existing test `2.2.3.1D` under the KPI1 area **Catalogue publication**.

This result should not be interpreted as part of the original Phase 1 / Phase 2 stack-comparison campaign. It is intended as an integration phase assessment of the current EMDS final technical infrastructure.

The score applies to the assessed CaaS deployment. The on-premise result
remains TBD for a separate assessment.
