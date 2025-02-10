## [1.3.1.1A] Participant onboarding: Certification - Identity and credentials issuance
### Stack: SIMPL

### Statement of assessment
#### Environment
The testing environment is an IMEC self-deployed instances of [Simpl-Open](https://code.europa.eu/simpl/simpl-open) on an IONOS Kubernetes cluster, the version used is 1.0.

#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
**The expected output of this test is to evaluate the level of customization required to integrate Gaia-X issued VC to SIMPL**

### Results
#### Assessment
SIMPL doesn't support Verifiable Credential as identity for authentication and authoritarian of Data Space flow, therefore it is not compatible with Gaia-X framework
as identity management framework.
However, SIMPL uses Verifiable Credential as Catalog for Data Space, which is using the [Gaia-X framework](https://gaia-x.eu/news-press/gaia-x-and-catalogues/).

#### Measured results

Based on the criteria outlined in the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria) section of the test description, the test is assigned the following score:

[x] Does the stack support VC? - As stated, SIMPL doesn't support VC as identity for authentication and authoritarian of Data Space flow.

[] The stack supports self-issued VCs 

[] The stack supports self-issued VCs with support for SD classes? 

[] The stack supports self-issued VCs where SD classes don't break the VC manager, a GAIA-X compatible DID method can
be used. No compliance or claim verification are mandatory, just a smoke test. 

[] The stack uses GAIA-X trust anchors.

[] The stack has a service that verifies credential compliance and a connector has policies to ensure a participant has
compliant GAIA-X descriptors 

[] The stack implements policies that can use SD classes to interpret claims and use a GXDCH clearing house for business
purposes

#### Functional suitability quality metric: 0

#### Notes
