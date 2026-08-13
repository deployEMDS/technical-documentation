# DSP-01: approved minimal HTTPS DSP negotiation

| Field | Observed value |
| --- | --- |
| Capture date | 2026-08-13 |
| Consumer connector | `connector-b` / `did:web:connector-b.194-164-194-95.sslip.io` |
| Provider connector | `connector-a` / `did:web:connector-a.194-164-194-95.sslip.io` |
| Provider DSP endpoint | `https://connector-a.194-164-194-95.sslip.io/api/dsp` |
| Existing asset | `asset1` |
| Existing policy | `policy1` |
| Existing contract definition | `contract3` |
| Catalog offer | `Y29udHJhY3Qz:YXNzZXQx:M2FhODhhZjYtMDA1Ny00ZTJhLTlmNzItYWE5YWZjZGZkZTQ0` |
| Consumer negotiation ID | `e39e55d7-e3ce-4ed5-8b8d-c9fc68d76295` |
| Provider negotiation ID | `2b3dd558-d319-4944-9255-06a659f9d542` |
| Agreement ID | `f48bd1f2-8c0c-4e0d-a9f1-890bf2c4ad48` |
| Consumer final state | `FINALIZED` |
| Provider final state | `FINALIZED` |

## Existing offer verification

The provider catalog returned `asset1` with an offer whose identifier encodes `contract3:asset1`. Provider management API queries confirmed that `contract3` selects `asset1` and uses `policy1` as both its access and contract policy. No asset, policy, contract definition, participant, credential, or data transfer was created or changed for this test.

## Existing provider resource payloads

The following are the exact responses returned by read-only provider management API requests on 2026-08-13. They are retained to make the negotiation reproducible. No credential-bearing fields were present. These objects already existed before the test and must not be recreated or modified by this procedure.

### Asset `asset1`

```json
{
	"@id": "asset1",
	"@type": "Asset",
	"properties": {
		"dct:accrualPeriodicity": "http://purl.org/cld/freq/irregular",
		"dct:title": "asset1",
		"dct:description": "test",
		"dct:publisher": {
			"foaf:name": "Fundacio i2CAT"
		},
		"id": "asset1",
		"dct:spatial": "http://publications.europa.eu/resource/authority/country/DEU",
		"mobilitydcatap:mobilityTheme": "https://w3id.org/mobilitydcat-ap/mobility-theme/other"
	},
	"dataAddress": {
		"@type": "DataAddress",
		"proxyPath": "true",
		"method": "GET",
		"type": "HttpData",
		"name": "asset1",
		"proxyBody": "false",
		"baseUrl": "https://jsonplaceholder.typicode.com/users"
	},
	"@context": {
		"adms": "http://www.w3.org/ns/adms#",
		"dct": "http://purl.org/dc/terms/",
		"dcat": "http://www.w3.org/ns/dcat#",
		"dcatap": "http://data.europa.eu/r5r/",
		"dqv": "http://www.w3.org/ns/dqv#",
		"foaf": "http://xmlns.com/foaf/0.1/",
		"mobilitydcatap": "https://w3id.org/mobilitydcat-ap#",
		"odps": "https://opendataproducts.org/v3.0/schema/odps.yaml#",
		"@vocab": "https://w3id.org/edc/v0.0.1/ns/",
		"edc": "https://w3id.org/edc/v0.0.1/ns/",
		"odrl": "http://www.w3.org/ns/odrl/2/"
	}
}
```

### Policy definition `policy1`

```json
{
	"@id": "policy1",
	"@type": "PolicyDefinition",
	"createdAt": 1786531563101,
	"policy": {
		"@id": "14c99e83-48a5-4852-ba21-8a613d1caf77",
		"@type": "odrl:Set",
		"odrl:permission": [],
		"odrl:prohibition": [],
		"odrl:obligation": []
	},
	"@context": {
		"adms": "http://www.w3.org/ns/adms#",
		"dct": "http://purl.org/dc/terms/",
		"dcat": "http://www.w3.org/ns/dcat#",
		"dcatap": "http://data.europa.eu/r5r/",
		"dqv": "http://www.w3.org/ns/dqv#",
		"foaf": "http://xmlns.com/foaf/0.1/",
		"mobilitydcatap": "https://w3id.org/mobilitydcat-ap#",
		"odps": "https://opendataproducts.org/v3.0/schema/odps.yaml#",
		"@vocab": "https://w3id.org/edc/v0.0.1/ns/",
		"edc": "https://w3id.org/edc/v0.0.1/ns/",
		"odrl": "http://www.w3.org/ns/odrl/2/"
	}
}
```

### Contract definition `contract3`

```json
{
	"@id": "contract3",
	"@type": "ContractDefinition",
	"accessPolicyId": "policy1",
	"contractPolicyId": "policy1",
	"assetsSelector": {
		"@type": "Criterion",
		"operandLeft": "id",
		"operator": "=",
		"operandRight": "asset1"
	},
	"@context": {
		"adms": "http://www.w3.org/ns/adms#",
		"dct": "http://purl.org/dc/terms/",
		"dcat": "http://www.w3.org/ns/dcat#",
		"dcatap": "http://data.europa.eu/r5r/",
		"dqv": "http://www.w3.org/ns/dqv#",
		"foaf": "http://xmlns.com/foaf/0.1/",
		"mobilitydcatap": "https://w3id.org/mobilitydcat-ap#",
		"odps": "https://opendataproducts.org/v3.0/schema/odps.yaml#",
		"@vocab": "https://w3id.org/edc/v0.0.1/ns/",
		"edc": "https://w3id.org/edc/v0.0.1/ns/",
		"odrl": "http://www.w3.org/ns/odrl/2/"
	}
}
```

## Correlated negotiation evidence

The consumer initiated one negotiation through its management API using the unchanged catalog offer. The consumer management response returned the consumer negotiation ID above. Its state and agreement queries reported `FINALIZED` and the agreement ID above, with `connector-a` as provider and `connector-b` as consumer.

Filtered consumer control-plane logs recorded the transition from `INITIAL` through `REQUESTING` and `REQUESTED`, an incoming DSP `ContractAgreementMessage`, verification, an incoming DSP `ContractNegotiationEventMessage`, and `FINALIZED`.

The provider negotiation query linked the same agreement ID to the provider negotiation ID above. Filtered provider control-plane logs recorded `REQUESTED`, agreement creation, an incoming DSP `ContractAgreementVerificationMessage`, verification, finalization, and `FINALIZED`.

Together with the TLS evidence in `TLS-01` through `TLS-03`, this demonstrates a completed connector-to-connector DSP agreement exchange over the validated HTTPS endpoint.

## Limitation

The captured logs show the DSP message exchange and the management agreement identifies the provider and consumer DIDs. They do not contain a direct authentication-event record that attributes successful peer authentication to a particular token, credential, or verification decision.

A focused Jaeger query for the provider's `POST /api/dsp/negotiations/request` span during the negotiation minute found trace `92e769ce5708f49192dbe592176e6a1c`. The span contained network client/peer metadata but no authentication, identity, DID, token, credential, or verification-decision tag. Focused provider control-plane, Identity Hub, and STS log searches likewise found no direct authentication event for the negotiation or agreement IDs.

The reused `asset1` / `policy1` / `contract3` semantics are assessed separately by [test `4.2.1.3`](../../test_4_2_1_3/test.md). Access restrictions for negotiation APIs, status messages, and logs are assessed separately by [test `4.2.3.1`](../../../refusal_or_registration_of_sharing_agreement/test_4_2_3_1/test.md). Those tests may provide complementary evidence.

## Collection method

An authorized local management client was used to:

1. Request the provider catalog from `connector-b` and select the existing `asset1` offer.
2. Verify the existing `policy1` and `contract3` mapping through read-only provider management queries.
3. Submit one `ContractRequest` to `POST /api/management/v3/contractnegotiations` on `connector-b` using the unchanged catalog offer.
4. Query consumer state and agreement endpoints and provider negotiation records.
5. Filter control-plane logs by the recorded negotiation and agreement IDs.

Management credentials, the full request body, the full catalog response, and unfiltered logs were not retained.
