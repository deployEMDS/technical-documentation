## [1.2.1.1] Participant onboarding: Evaluation - Self-assessment
### Stack: EDC+VC

### Statement of assessment
#### Environment
- The test is carried in the IONOS environment as documented in the [edc_mvd_deployment.md](../../../../../deployment/edc_vc/edc_mvd_deployment.md)
- The test uses the EDC MVD commit [84f3c5f7] (https://github.com/eclipse-edc/MinimumViableDataspace/commit/84f3c5f70b4eea94de7ebee83da377e62fc759fd)
#### Tested quality metric and method
The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx)
For current phase (phase 1), the test focus on the Functional suitability quality metric

[TODO] Describe the comparative criteria used for the test / assessment. If possible, align with the criteria used for the same test in the other stack(s).

#### Expected output
**The expected output of this test is to evaluate the level of customization required to input participants' metadata if an onboarding online facility is provided.**

### Results
#### Assessment
##### Onboarding Online Facility Scope

The scope of the onboarding online facility is detailed in the [EDC MVD commit 84f3c5f7](https://github.com/eclipse-edc/MinimumViableDataspace/commit/84f3c5f70b4eea94de7ebee83da377e62fc759fd), which includes:
- EDC Connector
- Identity Hub (EDC component)

###### Evaluation of MVD Commit [84f3c5f7] (https://github.com/eclipse-edc/MinimumViableDataspace/commit/84f3c5f70b4eea94de7ebee83da377e62fc759fd).

The MVD participates in the onboarding procedure as outlined in the [MVD version tag: 84f3c5f7](https://github.com/eclipse-edc/MinimumViableDataspace/commit/84f3c5f70b4eea94de7ebee83da377e62fc759fd).

- The MVD uses an extension to mount the pre-configured verifiable credentials to the Identity Hub with the configurable key `edc.mvd.credentials.path`: [Link](https://github.com/eclipse-edc/MinimumViableDataspace/blob/8cf5a75f39d43f18da60e931d6381727191dc275/.run/IdentityHub%20Consumer%20Corp.run.xml#L7). The mounting action is provided by this [extension](https://github.com/eclipse-edc/MinimumViableDataspace/blob/8cf5a75f39d43f18da60e931d6381727191dc275/launchers/identity-hub/src/main/java/org/eclipse/edc/demo/dcp/ih/IdentityHubExtension.java#L68).

- Managing the access key of the protected API of the Identity Hub is achieved by provisioning a `super user` with this [extension](https://github.com/eclipse-edc/MinimumViableDataspace/tree/main/extensions/superuser-seed):

  > IdentityHub's Identity API does not provide a feature for participant self-registration, as it is not an end-user-facing API. This is intentional. New participant contexts must be created by the super-user.

  For more details, refer to the [IdentityHub API documentation](https://github.com/eclipse-edc/IdentityHub/blob/main/docs/developer/architecture/identity-api.security.md#32-obtaining-an-api-key).

- The Identity Hub does not currently provide an API for storing verifiable credentials issued by an issuer: [Storage API documentation](https://github.com/eclipse-edc/IdentityHub/blob/main/docs/developer/architecture/identityhub-apis.md#storage-api) (tag: [2de93ac6add4b34d499eb210471d4e0590f5d0c3](https://github.com/eclipse-edc/IdentityHub/commit/2de93ac6add4b34d499eb210471d4e0590f5d0c3)).


###### Evaluation of Identity hub commit [572a6b0](https://github.com/eclipse-edc/IdentityHub/commit/572a6b031bf49bc14a54372b48e518916e9ea202)
Identithy hub provides following APIs
- `identity-api` contains the functions for CRUD on the `Verifiable Credentials`, `Key Pairs`, `DID`, and `Participant Context`.
- `ih-resolution-api` contains VC presentation `/v1/participants/{participantId}/presentations/query`

#### Measured results
The MVD test [link](https://github.com/eclipse-edc/MinimumViableDataspace/blob/84f3c5f70b4eea94de7ebee83da377e62fc759fd/seed-k8s.sh#L84) demonstrates onboarding a new participant to the Dataspace system. However, the entire onboarding process is not fully implemented in the EDC system and is not user-friendly for non-technical users.
The DID resolver must be implemented to resolve the participant's DID, which depends on the specific DID method used.
Besides that, the VC insurance flow is currently missing in the Identity hub.

**Is the feature available out of the box in EDC+VC (without the need for development)?** No, plugin adoption is required.
**Given a development effort, is it possible to implement to the fullest extent of the spec?** Yes, but the DID resolver is context-specific.

**Functional suitability quality metric: 3**

#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to write their own extensions.
