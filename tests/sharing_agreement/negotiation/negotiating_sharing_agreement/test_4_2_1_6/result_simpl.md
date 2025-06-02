## [4.2.1.6] Sharing agreement: Negotiation - Negotiating sharing agreement
### Stack: SIMPL

### Statement of assessment
#### Environment

The testing environment is an IMEC self-deployed instances of [Simpl-Open](https://code.europa.eu/simpl/simpl-open) on an IONOS Kubernetes cluster, the version used is 1.0.

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output

The test aims to assess whether the data sharing protocol is compatible with channel encryption (e.g., TLS) and whether connector authentication has occurred solely for the purpose of data sharing negotiation.

### Results
#### Assessment
The deployment of [Simpl-Open](https://code.europa.eu/simpl/simpl-open) fully utilizes [mTLS](https://www.cloudflare.com/learning/access-management/what-is-mutual-tls/) communication.

The onboarding process for participants in the [Simpl-Open](https://code.europa.eu/simpl/simpl-open) involves receiving X.509 certificates from the data space authority to establish secure communication [mTLS](https://www.cloudflare.com/learning/access-management/what-is-mutual-tls/) with the other participants.
[Simpl-Open](https://code.europa.eu/simpl/simpl-open) also provides a UI-based onboarding process to facilitate this, as detailed in [TEST_1.2.2.1_result_simpl.md](../../../../participant_onboarding/evaluation/self-assessment/test_1_2_1_1/result_simpl.md).

#### Measured results
As previously stated, [Simpl-Open](https://code.europa.eu/simpl/simpl-open) offers user interfaces for [mTLS](https://www.cloudflare.com/learning/access-management/what-is-mutual-tls/) integration as onboarding process for new participants (agent). 
According to the criteria detailed in the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section of the test description, the test is assigned the following score:

**Functional Suitability Quality Metric: 4**

#### Notes
The current testing version of SIMPL is a very basic Minimum Viable Product solution, version 1.0.   
