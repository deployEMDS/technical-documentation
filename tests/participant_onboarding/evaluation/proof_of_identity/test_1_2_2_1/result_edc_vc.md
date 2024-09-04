## [1.2.2.1] Participant onboarding: Evaluation - Proof of identity
### Stack: EDC+VC

### Statement of assessment
#### Environment
- The test is carried in the IONOS environment as documented in the [edc_mvd_deployment.md](../../../../../deployment/edc_vc/edc_mvd_deployment.md)
- The test uses the EDC MVD commit [84f3c5f7] (https://github.com/eclipse-edc/MinimumViableDataspace/commit/84f3c5f70b4eea94de7ebee83da377e62fc759fd)

#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
**The expected output of this test is to evaluate the level of customization required to use European/National identity provider as issuer for verifiable credentials.**

### Results
#### Assessment
##### European/National Identity Providers
Few national identity providers currently exist, such as Italy's SPID system (https://www.agid.gov.it/it/piattaforme/spid). However, the European initiative for a common identity provider, known as the European Digital Identity (EUDI), is in progress. This initiative builds on the eIDAS Regulation (https://digital-strategy.ec.europa.eu/en/policies/eudi-regulation) and includes four large-scale pilot projects:

1. **The [EU Digital Identity Wallet Consortium (EWC)](https://eudiwalletconsortium.org/) aims to leverage the benefits of the proposed EU digital identity, specifically focusing on Digital Travel Credentials across Member States. The EWC plans to develop a reference wallet application for these credentials. Part of this project includes providing organizational digital identity (https://eudiwalletconsortium.org/project/#), with tools for issuance and verification demonstrated in WP3 (https://eudiwalletconsortium.org/project/outputs/). Further details can be found on their website (https://ec.europa.eu/digital-building-blocks/sites/display/EUDIGITALIDENTITYWALLET/EU+Digital+Identity+Wallet+Home).**

2. [POTENTIAL](https://www.digital-identity-wallet.eu/) seeks to promote innovation, collaboration, and growth in six digital identity sectors: governmental services, banking, telecommunications, mobile driving licenses, electronic signatures, and health.

3. [NOBID](https://www.nobidconsortium.com/) involves Nordic and Baltic countries, along with Italy and Germany, piloting the use of the EU Digital Identity Wallet for authorizing payments for products and services.

4. [DC4EU](https://www.dc4eu.eu/) supports the public and private sectors in education and social security by deploying interoperable digital service infrastructures and integrating them into a cross-border trust framework.

#### Deliverables:[EU Digital Identity Wallet](https://ec.europa.eu/digital-building-blocks/sites/display/EUDIGITALIDENTITYWALLET/EU+Digital+Identity+Wallet+Home)
- European Digital Identity's implementations can be found in the GitHub repository [here](https://github.com/eu-digital-identity-wallet), with Verifiable Credentials being an intrinsic part of the EU digital identity wallet.
- The reference implementation of the EU Digital Identity Wallet is available on the [Wallet Reference Implementation - Open Source Code](https://github.com/eu-digital-identity-wallet#wallet-reference-implementation---open-source-code). This implementation enables Member States and other interested parties to develop their own digital wallets.
- The reference implementation includes [issuing services](https://github.com/eu-digital-identity-wallet/.github/blob/main/profile/reference-implementation.md#issuing-apps-and-services), which provide a credential issuing service according to OpenId4VCI - draft12. This includes a test PID and mDL issuing service in mDoc format, with support for SD-JWT-VC format coming soon.
- The issuing service is implemented in both Python and Kotlin, which can be found in the [issuing-service](https://github.com/eu-digital-identity-wallet/.github/blob/main/profile/reference-implementation.md#issuing-apps-and-services).
- Instructions on how to build demo-able use cases are located in the [Demoable Use Cases](https://github.com/eu-digital-identity-wallet/.github/blob/main/profile/reference-implementation.md#issuing-apps-and-services) section. These use cases are mobile-based, and demo videos are available [here](https://github.com/eu-digital-identity-wallet/eudi-app-ios-wallet-ui?tab=readme-ov-file#demo-videos).
 
#### Integration with EDC ecosystem
In the testing environment, we observed that EDC MVD commit [84f3c5f7](https://github.com/eclipse-edc/MinimumViableDataspace/commit/84f3c5f70b4eea94de7ebee83da377e62fc759fd) has not yet included the issuance flow. 
Consequently, verifiable credentials issued by European or National identity providers cannot be automatically stored and verified within the EDC ecosystem.
Additionally, a DID resolver extension needs to be implemented to resolve participants' DIDs, depending on the specific DID method used. 
Also, the reference implementation of the EU Digital Identity Wallet targets mobile-based use cases and is not directly integrated with the EDC ecosystem.


#### Measured results
- As stated, the EDC ecosystem has not yet fully integrated with European/National identity providers.This integration requires a DID resolver extension to resolve participants' DIDs and the implementation of an issuance flow to store and verify the verifiable credentials issued by European/National identity providers.
- Therefore, based on the criteria outlined in the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section of the test description, and considering that the EDC ecosystem has not yet fully integrated with European/National identity providers, with the assumption that the required development will be completed to support a full verifiable credential cycle, the evaluation scores for each criterion are as follows:

| **Criterion**          | **Description**                                                                                          | **Score (0-4)** | **Explanation**                                                                                                                                                                                             |
|------------------------|----------------------------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Confidentiality**    | The platform ensures that data are accessible only to those authorized to have access according to the data negotiation. | 2               | Currently, the integration with European/National identity providers is incomplete, which may impact the confidentiality of the data in certain scenarios. Once fully integrated, this score could improve. |
| **Integrity**          | How the platform prevents unauthorized access to, or modification of the data.                            | 3               | 	The EDC solution has measures in place to protect data from unauthorized access and modification, but incomplete integration limit its effectiveness.                                                      |
| **Non-repudiation**    | How the actions or events can be proven to have taken place so that the events or actions cannot be repudiated later. | 2               | Without full integration, ensuring non-repudiation for all actions and events with the customized DID resolver may be challenging.                                                                          |
| **Accountability**     | The actions of an entity can be traced uniquely to the entity.                                            | 3               | 	The EDC solution provides a level of traceability for actions, but integration gaps might affect the ability to fully trace actions to entities.                                                           |
| **Authenticity**       | The resource can be proved to be the one claimed.                                                         | 2               | The EDC system doesnt not prove authenticity fully due to incomplete integration with identity providers. This is expected to improve with extension development.                                           |

Overall Calculation: ( 2 + 3 + 2 + 3 + 2) / 5 = 2.4

Functional Suitability Quality Metric Score: 2.4

#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to write their own extensions.

