## [1.3.1.5] Participant Onboarding: Certification - Identity and Credentials Issuance
### Stack: EDC + VC

### Assessment Statement
#### Environment
- The test is conducted in a local environment using IntelliJ IDE.
- The EDC MVD commit used is [650ed8f](https://github.com/eclipse-edc/MinimumViableDataspace/commit/650ed8fbc4b19e152ef2491d86f5ab3b316a6fec).

#### Tested Quality Metric and Method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected Output
The expected output of the test is an assessment of whether the EDC supports the full credential lifecycle, including request, issuance, validation, renewal, and revocation.**

### Results
#### Assessment
##### Protocol Support
The EDC identity hub implements the [Eclipse Dataspace Decentralized Claims Protocol](https://projects.eclipse.org/projects/technology.dataspace-dcp/governance), also known as [Identity And Trust Specifications](https://github.com/eclipse-tractusx/identity-trust). The protocol covers the credential issuance protocol and verifiable presentation protocol.

##### Current Implementation of the Protocol
The EDC identity hub version 0.8.1-SNAPSHOT provides endpoints for:
- Querying verifiable credentials:
  - `/v1alpha/credentials`
- Revoking verifiable credentials:
  - `/v1alpha/participants/{participantId}/credentials/{credentialId}`
- Presenting verifiable credentials:
  - `/v1/participants/{participantId}/presentations/query`

Additional identity management APIs are available [identity-api.yaml](https://github.com/eclipse-edc/IdentityHub/blob/gh-pages/openapi/identity-api/0.8.1-SNAPSHOT/identity-api.yaml).
 and [ih-resolution-api.yaml](https://github.com/eclipse-edc/IdentityHub/blob/gh-pages/openapi/ih-resolution-api/0.8.1-SNAPSHOT/ih-resolution-api.yaml).

However, the implementation of the Credential Issuance Protocol is planned for future updates and has not been implemented yet.

###### Evaluation of MVD Commit [650ed8f](https://github.com/eclipse-edc/MinimumViableDataspace/commit/650ed8fbc4b19e152ef2491d86f5ab3b316a6fec)
The VC lifecycle is partially covered by the EDC MVD as follows:
- **Issuance and Storage**: Available with the workaround extension function `seedCredentials`.
- **Presentation**: Covered.
- **Verification & Use**: Covered, using public key validation as explained in [edc-did](https://github.com/eclipse-edc/Connector/tree/980f10f2ad21368a2dc07cf3654e640aa01e3216/extensions/common/iam/decentralized-identity). The validation function is in [TokenValidationService](https://github.com/eclipse-edc/Connector/blob/980f10f2ad21368a2dc07cf3654e640aa01e3216/docs/developer/decision-records/2023-12-19-token-handling-refactor/README.md#tokenvalidationservice).
In the MVD, a mock `DID Resolver` is used to resolve the DID of the participant.
- **Revocation/Expiration**: Covered, with API support for revoking verifiable credentials.
- **Renewal/Re-Issuance**: Not covered; renewal and re-issuance are not yet implemented.


The following sequence is performed whenever a request is received:

**C ... Consumer, P ... Provider, CIH ... Consumer's Identity Hub, VC ... Verifiable Credential**

- C presents JWT to P (in message header, i.e. in the authorization header)
- P resolves the DID URL from the VC received from C
- P resolves C's DID Document from the DID URL (in current case is the CIH)
- P verifies C's VC using C's public key (from the DID Document)
- P sends query to `CredentialService` endpoint for the VC presentation of C, A typical `CredentialService` is e.g. `http://{service_url}/api/resolution/v1/participants/`, the endpoint of `CredentialService` is in the DID Document.
- p validate the VPs using the public key of the VC issuer (from the DID Document)
- P looks for the expected claims in the VP
- P applies the claims to the policy and makes a decision.

#### Measured Results
The EDC implementation partially covers the VC lifecycle as outlined above.  Based on the criteria outlined in the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section of the test description, the test is assigned the following score:

| **VC Lifecycle Stage**          | **Coverage**                                                       | **Score (0-4)** |
|---------------------------------|--------------------------------------------------------------------|-----------------|
| **Issuance and Storage**         | Available with the workaround extension function `seedCredentials`. | 0               |
| **Presentation**                 | Covered                                                            | 4               |
| **Verification & Use**           | Covered                                                            | 4               |
| **Revocation/Expiration**        | Covered                                                            | 4               |
| **Renewal/Re-Issuance**          | Not covered.           | 0               |

**Overall score: (0+4+4+4+0)/5 = 2.4**

#### Notes
- EDC components are plugin-based. Support for various verifiable credential formats is possible by implementing a plugin (this applies to both decentralized as well as centralized solutions). For example, support for web DID resolution is just a preview of a method that can be created. See [docs](https://github.com/eclipse-edc/Publications/blob/main/Identity%20Management/DID_EDC.md).
- EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. While some extensions are available for plug-and-play, specific use cases may require developers to create their own extensions.
