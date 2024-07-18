## [1.3.1.5] Participant onboarding: Certification - Identity and credentials issuance
### Stack: EDC+VC

### Statement of assessment
#### Environment
- The test is carried in the local environment within Intellij IDE.
- The test uses the EDC MVD commit [650ed8f](https://github.com/eclipse-edc/MinimumViableDataspace/commit/650ed8fbc4b19e152ef2491d86f5ab3b316a6fec).
#### Tested quality metric and method
The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx)
For current phase (phase 1), the test focus on the Functional suitability quality metric

[TODO] Describe the comparative criteria used for the test / assessment. If possible, align with the criteria used for the same test in the other stack(s).

#### Expected output
**The expected output of test is an assessment regarding if full credential lifecycle is supported by EDC which includes request, issuance, validation, renewal, revocation.**

### Results
#### Assessment
##### Protocol support
The EDC identity hub implements the [Eclipse Dataspace Decentralized Claims Protocol](https://projects.eclipse.org/projects/technology.dataspace-dcp/governance) a.k.a. [Identity And Trust Specifications](https://github.com/eclipse-tractusx/identity-trust)
The protocol covers the credential issuance protocol, and verifiable presentation protocol. 

##### Current implemenatio of the protocol
The EDC identity hub snapshot 0.8.1-SNAPSHOT provides endpoint for
- Query the verifiable credentials: 
  - `/v1alpha/credentials`
- Revoke the verifiable credentials:
  - `/v1alpha/participants/{participantId}/credentials/{credentialId}`
- Present the verifiable credentials:
  - `/v1alpha/participants/{participantId}/presentations/query`

More identity management API locates at [here](https://github.com/eclipse-edc/IdentityHub/blob/gh-pages/openapi/identity-api/0.8.1-SNAPSHOT/identity-api.yaml) <br />
The EDC identity hub also provides the endpoint for verifiable credential presentation at `/v1/participants/{participantId}/presentations/queryy` [More details](https://github.com/eclipse-edc/IdentityHub/blob/gh-pages/openapi/ih-resolution-api/0.8.1-SNAPSHOT/ih-resolution-api.yaml). <br />
However, Implementation of the Credential Issuance Protocol is in the future roadmap of the EDC identity hub, which have not been implemented yet.

###### Evaluation of MVD Commit [650ed8f](https://github.com/eclipse-edc/MinimumViableDataspace/commit/650ed8fbc4b19e152ef2491d86f5ab3b316a6fec)
The lifecycle VC has been partially covered by the EDC MVD as outlined as follows:
- **Issuance and Storage**: with workaround extension funciton `seedCredentials`.
- **Presentation**: covered
- **Verification & Use**: covered, which is implemented in the [identityhub:core:lib](https://github.com/eclipse-edc/IdentityHub/blob/main/docs/developer/architecture/identity-trust-protocol/identity-hub-modules.md#authpermission-modules-corelib), by calling [TokenValidationService](https://github.com/eclipse-edc/Connector/blob/980f10f2ad21368a2dc07cf3654e640aa01e3216/docs/developer/decision-records/2023-12-19-token-handling-refactor/README.md#tokenvalidationservice).
- **Revocation/Expiration**: covered. API support for revoking the verifiable credentials.    
- **Renewal/Re-Issuance**: Not covered, renewal and re-issuance are not implemented in the 

#### Measured results
The EDC implementation partially covers the VC lifecycle as outlined above.
**Functional suitability quality metric: 3**

#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to write their own extensions.
