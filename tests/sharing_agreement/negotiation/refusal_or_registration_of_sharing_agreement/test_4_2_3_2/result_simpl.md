## [4.2.3.2] Sharing agreement: Negotiation - Refusal or registration of sharing agreement
### Stack: SIMPL

### Statement of assessment
#### Environment

The testing environment is an IMEC self-deployed instances of [Simpl-Open](https://code.europa.eu/simpl/simpl-open) on
an IONOS Kubernetes cluster, the version used is 1.0.

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined
in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1,
the focus is on the Functional Suitability metric. For detailed information, please refer to
the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test
description.

#### Expected output

The expected outcome of the current test is to evaluate whether the system provides an observability trace of the sharing agreement (privacy terms of observability are out of scope).

### Results
#### Assessment

Since [Simpl-Open](https://code.europa.eu/simpl/simpl-open) utilizes the [EDC connector](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-edc) for data space protocol implementation (including sharing agreement establishment), 
the trace mentioned in [test_4_2_3_2_result_edc_vc.md](result_edc_vc.md) is also available in SIMPL. 
Additionally, SIMPL-OPEN offers a UI to display the negotiation status and uses Filebeat to collect logs and send them to the ELK stack for further analysis, 
as detailed in [test_4_2_1_7_result_simpl.md](../../negotiating_sharing_agreement/test_4_2_1_7/result_simpl.md).

#### Measured results

Based on the criteria outlined in the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section of the test description, the test is assigned the following score:

**Functional Suitability Quality Metric: 4**

#### Notes

The current testing version of SIMPL is a very basic Minimum Viable Product solution, version 1.0.   
