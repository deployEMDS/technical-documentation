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

[Simpl-Open](https://code.europa.eu/simpl/simpl-open) doesn't use Verifiable Credential as identity for authentication and authorization of Data Space flow.
However, [Simpl-Open](https://code.europa.eu/simpl/simpl-open) uses Verifiable Credential as Catalog for Data Space, which is using the [Gaia-X framework](https://gaia-x.eu/news-press/gaia-x-and-catalogues/).
[Simpl-Open](https://code.europa.eu/simpl/simpl-open) includes [poc-gaia-edc](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/poc-gaia-edc) uses [GAIA-X Service Characteristics](https://gitlab.eclipse.org/eclipse/xfsc/self-description-tooling/sd-schemas/sd-schemas) to
develop compliant Gaia-X Credentials which is part of [poc-gaia-edc](https://gitlab.eclipse.org/eclipse/xfsc/self-description-tooling), the self-description here is used for creating service offering or contract.

#### Measured results

Based on the criteria outlined in the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria) section of the test description, the test is assigned the following score:

[] Does the stack support VC? - As stated, SIMPL doesn't support VC as identity for authentication and authoritarian of Data Space flow.

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

The current testing version of SIMPL is a very basic Minimum Viable Product solution, version 1.0.   
