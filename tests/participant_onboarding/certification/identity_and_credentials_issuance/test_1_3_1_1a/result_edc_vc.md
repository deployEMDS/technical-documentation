## [1.3.1.1A] Participant onboarding: Certification - Identity and credentials issuance
### Stack: EDC+VC

### Statement of assessment
#### Environment
* [EDC IdentityHub 0.8.0](https://github.com/eclipse-edc/IdentityHub)
* [Gaia-X VC Wizard](https://wizard.lab.gaia-x.eu/)


#### Comparative criteria (checklists, ...)

* Does the stack support VC?

* The stack supports self-issued VCs

* The stack supports self-issued VCs with support for SD classes?

* The stack supports self-issued VCs where SD classes don't break the VC manager, a GAIA-X compatible DID method can be used. No compliance or claim verification are mandatory, just a smoke test.

* The stack uses GAIA-X trust anchors. -> N/A, This test requires the setup of a GXDCH infrastructure that we don't have, yet.

* The stack has a service that verifies credential compliance and a connector has policies to ensure a participant has compliant GAIA-X descriptors -> N/A, requires GAIA-X infrastructure

* The stack implements policies that can use SD classes to interpret claims and use a GXDCH clearing house for business purposes -> N/A, requires GAIA-X infrastructure


### Results

[x] Does the stack support VC? - PASS

[x] The stack supports self-issued VCs - PASS

[x] The stack supports self-issued VCs with support for SD classes? - FAIL

[] The stack supports self-issued VCs where SD classes don't break the VC manager, a GAIA-X compatible DID method can be used. No compliance or claim verification are mandatory, just a smoke test.

[] The stack uses GAIA-X trust anchors. -> N/A, This test requires the setup of a GXDCH infrastructure that we don't have, yet.

[] The stack has a service that verifies credential compliance and a connector has policies to ensure a participant has compliant GAIA-X descriptors -> N/A, requires GAIA-X infrastructure

[] The stack implements policies that can use SD classes to interpret claims and use a GXDCH clearing house for business purposes -> N/A, requires GAIA-X infrastructure

#### Notes
EDC components are plugin-based. Support for various verifiable credential formats is possible by implementing a plugin (this applies to both decentralized as well as centralized solutions). For examplem, support for web DID resolution is just a preview of a method that can be created. See [docs](https://github.com/eclipse-edc/Publications/blob/main/Identity%20Management/DID_EDC.md).
