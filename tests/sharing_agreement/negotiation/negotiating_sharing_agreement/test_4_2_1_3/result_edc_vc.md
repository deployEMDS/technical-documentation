## [4.2.1.1] Sharing agreement: Negotiation - Negotiating sharing agreement
### Stack: EDC+VC

### Statement of assessment
#### Environment
- The test utilizes the EDC MVD commit [5d58b38](https://github.com/eclipse-edc/MinimumViableDataspace/commit/5d58b3871983ce00a69a38b3215c6a8cb67d8ced).
- The test is executed in an Ubuntu environment using IntelliJ.
#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
The test aims to evaluate the coverage of the following criteria on contract negotiation:
- Claim verification
- Usage policy rules
- Service Agreements

### Results
#### Assessment
##### EDC solution overview
The EDC connector features a [policy engine](https://github.com/eclipse-edc/Connector/blob/main/docs/developer/policy-engine.md) designed to process specified usage policies. These policies can be defined across various scopes, such as:
- Cataloging scope: `contract.cataloging`
- Negotiation scope: `contract.negotiation`
- Manifest verification scope: `provision.manifest.verify`

This policy engine can be added and activated as an extension to the EDC connector services.

#### EDC MVD implementation commit [5d58b38](https://github.com/eclipse-edc/MinimumViableDataspace/commit/5d58b3871983ce00a69a38b3215c6a8cb67d8ced)
Details on how policies are defined for assets in MVD Access Control can be found [here](https://github.com/eclipse-edc/MinimumViableDataspace?tab=readme-ov-file#33-access-control).
Specifically, for negotiating policy rules, an asset might require a Data Processor credential with a "level": "processing" to negotiate a contract and transfer data.
The implementation of this requirement is explained [here](https://github.com/eclipse-edc/MinimumViableDataspace?tab=readme-ov-file#73-scope-extractor-for-dataprocessor-credentials).
An example of a policy requiring the consumer to present a DataProcessorCredential with an access level of processing, represented in ODRL, would look like this:
```json
{
  "@type": "http://www.w3.org/ns/odrl/2/Set",
  "odrl:obligation": [
    {
      "odrl:action": "use",
      "odrl:constraint": {
        "@type": "LogicalConstraint",
        "odrl:leftOperand": "DataAccess.level",
        "odrl:operator": {
          "@id": "odrl:eq"
        },
        "odrl:rightOperand": "processing"
      }
    }
  ]
}
```
The implementation of the policy engine for verifying the correct claim is detailed [here](https://github.com/eclipse-edc/MinimumViableDataspace?tab=readme-ov-file#742-dataaccesslevel-evaluation-function).

##### Test result
After defining the asset and policy, when requesting the catalog, the mentioned processing policy is present as follows:
```json
        {
            "@id": "asset-1",
            "@type": "dcat:Dataset",
            "odrl:hasPolicy": {
                "@id": "bWVtYmVyLWFuZC1kYXRhcHJvY2Vzc29yLWRlZg==:YXNzZXQtMQ==:NWRiNjQxOTUtNGYyZC00ZWU0LTk0MWQtMWEwMGUyYzU0OTkz",
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
            }}
```
When the consumer holds the DataProcessorCredential with the correct claim `level`: `processing`:
```json
{
        "participantId": "did:web:localhost%3A7083",
        "id": "40e24588-b510-41ca-966c-c1e0f57d1b15",
        "timestamp": 1700659822500,
        "issuerId": "did:example:dataspace-issuer",
        "holderId": "did:web:localhost%3A7093",
        "state": 500,
        "timeOfLastStatusUpdate": null,
        "issuancePolicy": null,
        "reissuancePolicy": null,
        "verifiableCredential": {
            "rawVc": "eyJraWQiOiJkaWQ6ZXhhbXBsZTpkYXRhc3BhY2UtaXNzdWVyI2tleS0xIiwidHlwIjoiSldUIiwiYWxnIjoiRWREU0EifQ.eyJpc3MiOiJkaWQ6ZXhhbXBsZTpkYXRhc3BhY2UtaXNzdWVyIiwiYXVkIjoiZGlkOndlYjphbGljZS1pZGVudGl0eWh1YiUzQTcwODM6YWxpY2UiLCJzdWIiOiJkaWQ6d2ViOmFsaWNlLWlkZW50aXR5aHViJTNBNzA4MzphbGljZSIsInZjIjp7IkBjb250ZXh0IjpbImh0dHBzOi8vd3d3LnczLm9yZy8yMDE4L2NyZWRlbnRpYWxzL3YxIiwiaHR0cHM6Ly93M2lkLm9yZy9zZWN1cml0eS9zdWl0ZXMvandzLTIwMjAvdjEiLCJodHRwczovL3d3dy53My5vcmcvbnMvZGlkL3YxIix7Im12ZC1jcmVkZW50aWFscyI6Imh0dHBzOi8vdzNpZC5vcmcvbXZkL2NyZWRlbnRpYWxzLyIsImNvbnRyYWN0VmVyc2lvbiI6Im12ZC1jcmVkZW50aWFsczpjb250cmFjdFZlcnNpb24iLCJsZXZlbCI6Im12ZC1jcmVkZW50aWFsczpsZXZlbCJ9XSwiaWQiOiJodHRwOi8vb3JnLnlvdXJkYXRhc3BhY2UuY29tL2NyZWRlbnRpYWxzLzIzNDciLCJ0eXBlIjpbIlZlcmlmaWFibGVDcmVkZW50aWFsIiwiaHR0cDovL29yZy55b3VyZGF0YXNwYWNlLmNvbSNEYXRhUHJvY2Vzc29yQ3JlZGVudGlhbCJdLCJpc3N1ZXIiOiJkaWQ6ZXhhbXBsZTpkYXRhc3BhY2UtaXNzdWVyIiwiaXNzdWFuY2VEYXRlIjoiMjAyMy0wOC0xOFQwMDowMDowMFoiLCJjcmVkZW50aWFsU3ViamVjdCI6eyJpZCI6ImRpZDp3ZWI6bG9jYWxob3N0JTNBNzA4MyIsImNvbnRyYWN0VmVyc2lvbiI6IjEuMC4wIiwibGV2ZWwiOiJwcm9jZXNzaW5nIn19LCJpYXQiOjE3MjEzODU0Nzd9.vmumM-nRghKDASiwXZoRumnGAq_aRRw7UNO6PaIZZGu-Swl4GQzL5-4aXhEw0FrRMBRchmK9_FUcWenzbcBaDw",
            "format": "JWT",
            "credential": {
                "credentialSubject": [
                    {
                        "id": null,
                        "claims": {
                            "id": "did:web:localhost%3A7083",
                            "contractVersion": "1.0.0",
                            "level": "processing"
                        }
                    }
                ],
                "id": "http://org.yourdataspace.com/credentials/1235",
                "type": [
                    "VerifiableCredential",
                    "DataProcessorCredential"
                ],
                "issuer": {
                    "id": "did:example:dataspace-issuer",
                    "additionalProperties": {}
                },
                "issuanceDate": "2023-12-12T00:00:00Z",
                "expirationDate": null,
                "credentialStatus": null,
                "description": null,
                "name": null
            }
        }
    }
```
The contract negotiation can be finalized as shown in the following logs (`provider connector`):
```text
DEBUG 2024-07-25T13:55:14.720153173 DSP: Incoming ContractRequestMessage for class org.eclipse.edc.connector.controlplane.contract.spi.types.negotiation.ContractNegotiation process
DEBUG 2024-07-25T13:55:14.723165306 Resolving secret did:web:localhost%3A7093-alias
DEBUG 2024-07-25T13:55:14.913240117 [PROVIDER] ContractNegotiation 3b25dc23-d6cc-49b8-9646-08e05c6643dc is now in state REQUESTED.
DEBUG 2024-07-25T13:55:15.435605921 [ProviderContractNegotiationManagerImpl] ContractNegotiation 3b25dc23-d6cc-49b8-9646-08e05c6643dc is now in state AGREEING
DEBUG 2024-07-25T13:55:15.435949373 ContractNegotiation: ID 3b25dc23-d6cc-49b8-9646-08e05c6643dc. [Provider] send agreement
DEBUG 2024-07-25T13:55:15.505215217 Resolving secret did:web:localhost%3A7093-alias
DEBUG 2024-07-25T13:55:15.5077679 Resolving secret did:web:localhost%3A7093-alias
DEBUG 2024-07-25T13:55:15.774987457 ContractNegotiation: ID 3b25dc23-d6cc-49b8-9646-08e05c6643dc. [Provider] send agreement
DEBUG 2024-07-25T13:55:15.775180158 [ProviderContractNegotiationManagerImpl] ContractNegotiation 3b25dc23-d6cc-49b8-9646-08e05c6643dc is now in state AGREED
DEBUG 2024-07-25T13:55:16.806352433 DSP: Incoming ContractAgreementVerificationMessage for class org.eclipse.edc.connector.controlplane.contract.spi.types.negotiation.ContractNegotiation process: 3b25dc23-d6cc-49b8-9646-08e05c6643dc
DEBUG 2024-07-25T13:55:16.807737507 Resolving secret did:web:localhost%3A7093-alias
DEBUG 2024-07-25T13:55:17.111140063 [PROVIDER] ContractNegotiation 3b25dc23-d6cc-49b8-9646-08e05c6643dc is now in state VERIFIED.
DEBUG 2024-07-25T13:55:17.517919388 [ProviderContractNegotiationManagerImpl] ContractNegotiation 3b25dc23-d6cc-49b8-9646-08e05c6643dc is now in state FINALIZING
DEBUG 2024-07-25T13:55:17.518778651 ContractNegotiation: ID 3b25dc23-d6cc-49b8-9646-08e05c6643dc. [Provider] send finalization
DEBUG 2024-07-25T13:55:17.561509541 Resolving secret did:web:localhost%3A7093-alias
DEBUG 2024-07-25T13:55:17.562880316 Resolving secret did:web:localhost%3A7093-alias
DEBUG 2024-07-25T13:55:17.82966994 ContractNegotiation: ID 3b25dc23-d6cc-49b8-9646-08e05c6643dc. [Provider] send finalization
DEBUG 2024-07-25T13:55:17.829790031 [ProviderContractNegotiationManagerImpl] ContractNegotiation 3b25dc23-d6cc-49b8-9646-08e05c6643dc is now in state FINALIZED
```
If the correct VC is removed from the `consumer` who initiates the negotiation, we can see the negotiation is rejected by the `provider`:
```text
DEBUG 2024-07-25T14:11:29.119011936 [Provider] Contract offer rejected as invalid: Policy in scope contract.negotiation not fulfilled for offer bWVtYmVyLWFuZC1kYXRhcHJvY2Vzc29yLWRlZg==:YXNzZXQtMQ==:NTlmNTEwMTctZGNmMy00MDZhLTg2YTQtNDdkNjM4OGMwYWJi, policy evaluation Duty constraint: [Constraint 'DataAccess.level' EQ 'processing']
```
#### Measured results
From the above behavior, we can conclude that EDC has a complete ecosystem that supports claim verification with policy rule definition and policy engine. However, due to the nature of EDC, these features are not out-of-the-box and require extension development work.
The Service Agreements, specifically [TM Forum Agreement](https://datamodel.tmforum.org/en/latest/EngagedParty/Agreement/), are not supported by the EDC architecture. Therefore, for this coverage test, the EDC ecosystem can check the first two boxes with an X.

- [X] Claim verification
- [X] Usage policy rules
- [ ] Service Agreements

Based on the criteria outlined in the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria) section of the test description, the test is assigned the following score:

**Functional suitability quality metric: 2**
#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to write their own extensions.
