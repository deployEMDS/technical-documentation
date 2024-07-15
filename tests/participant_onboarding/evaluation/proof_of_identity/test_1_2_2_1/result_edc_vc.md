## [1.2.2.1] Participant onboarding: Evaluation - Proof of identity
### Stack: EDC+VC

### Statement of assessment
#### Environment
- The test is carried in the IONOS environment as documented in the [edc_mvd_deployment.md](../../../../../deployment/edc_vc/edc_mvd_deployment.md)
- The test uses the EDC MVD commit [84f3c5f7] (https://github.com/eclipse-edc/MinimumViableDataspace/commit/84f3c5f70b4eea94de7ebee83da377e62fc759fd)

#### Tested quality metric and method
The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx)
For current phase (phase 1), the test focus on the Functional suitability quality metric

#### Comparative criteria (checklists, ...)
[TODO] Describe the comparative criteria used for the test / assessment. If possible, align with the criteria used for the same test in the other stack(s).

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

**As these projects are in the pilot stage, the verifiable credentials issued by European/National identity providers and their schemas are not yet standardized. Requests have been paused to European Digital Identity Wallet Consortium (EWC) to provide the project's output and the flow of issuance and verification of verifiable credentials.**

**#TODO follow up**

 
#### Integration with EDC ecosystem
With the testing environment, we noticed that EDC MVD commit [84f3c5f7] (https://github.com/eclipse-edc/MinimumViableDataspace/commit/84f3c5f70b4eea94de7ebee83da377e62fc759fd)
hasn't yet include the insurance flow, which the verifiable credentials issued by European/National identity provider cannot be auto stored and verified by the EDC ecosystem.
A DID resolver extension also needs to be implemented to resolve the participant's DID, which depends on the specific DID method used.


#### Measured results
- From a digital identity perspective, the ecosystem has not been well-developed at the European level, and the project outputs are currently unclear.
- From the EDC ecosystem perspective, the EDC ecosystem has not yet fully integrated with European/National identity providers. This integration requires a DID resolver extension to resolve participants' DIDs and an implementation of issuance flow to store and verify the verifiable credentials issued by European/National identity providers.

- **Functional suitability quality metric: 3**

#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to write their own extensions.

