## [1.3.1.5] Participant Onboarding: Certification - Identity and Credentials Issuance
### Stack: EDC + VC

### Assessment Statement
#### Environment
- The test is conducted in a local environment using IntelliJ IDE.
- The EDC MVD commit used is [650ed8f](https://github.com/eclipse-edc/MinimumViableDataspace/commit/650ed8fbc4b19e152ef2491d86f5ab3b316a6fec).

#### Tested Quality Metric and Method
The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). For the current phase (phase 1), the test focuses on the Functional Suitability quality metric.

[TODO] Describe the comparative criteria used for the test/assessment. If possible, align with the criteria used for the same test in the other stack(s).

#### Expected Output
**The expected output of the test is an assessment of whether the EDC supports the full credential lifecycle, including request, issuance, validation, renewal, and revocation.**

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
  - `/v1alpha/participants/{participantId}/presentations/query`

Additional identity management APIs are available [here](https://github.com/eclipse-edc/IdentityHub/blob/gh-pages/openapi/identity-api/0.8.1-SNAPSHOT/identity-api.yaml).

The EDC identity hub also offers an endpoint for verifiable credential presentation at `/v1/participants/{participantId}/presentations/query`. [More details](https://github.com/eclipse-edc/IdentityHub/blob/gh-pages/openapi/ih-resolution-api/0.8.1-SNAPSHOT/ih-resolution-api.yaml).

However, the implementation of the Credential Issuance Protocol is planned for future updates and has not been implemented yet.

###### Evaluation of MVD Commit [650ed8f](https://github.com/eclipse-edc/MinimumViableDataspace/commit/650ed8fbc4b19e152ef2491d86f5ab3b316a6fec)
The VC lifecycle is partially covered by the EDC MVD as follows:
- **Issuance and Storage**: Available with the workaround extension function `seedCredentials`.
- **Presentation**: Covered.
- **Verification & Use**: Covered, using public key validation as explained in [edc-did](https://github.com/eclipse-edc/Connector/tree/980f10f2ad21368a2dc07cf3654e640aa01e3216/extensions/common/iam/decentralized-identity). The validation function is in [TokenValidationService](https://github.com/eclipse-edc/Connector/blob/980f10f2ad21368a2dc07cf3654e640aa01e3216/docs/developer/decision-records/2023-12-19-token-handling-refactor/README.md#tokenvalidationservice).
In the MVD, a mock `DID Resolver` is used to resolve the DID of the participant.
- **Revocation/Expiration**: Covered, with API support for revoking verifiable credentials.
- **Renewal/Re-Issuance**: Not covered; renewal and re-issuance are not yet implemented.

#### Measured Results
The EDC implementation partially covers the VC lifecycle as outlined above.
**Functional Suitability Quality Metric: 3**

#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. While some extensions are available for plug-and-play, specific use cases may require developers to create their own extensions.
