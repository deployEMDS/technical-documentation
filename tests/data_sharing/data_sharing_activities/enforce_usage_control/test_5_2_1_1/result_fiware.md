## [5.2.1.1] Data sharing: Data sharing activities - Enforce usage control
### Stack: Fiware

### Statement of assessment
#### Environment

The test is conducted in the IONOS FIWARE_cluster cluster using node pool IP 85.215.161.198.

#### Tested quality metric and method

The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). For the current phase (phase 1), the test focuses on the Functional Suitability quality metric.

#### Comparative criteria (checklists, ...)
| Criteria           | Scoring          |
| ------------- | ------------- |
| No out of the box policies  | 0 |
| No out of the box policies but policies are available from a library  | 1 |
| Partial out-of-the-box-policies  | 2 |
| Full set of out-of-the-box policies  | 3 |
| Documented way to create/expand policies  | +1 |
| Documented way to create/expand policies + templates for basic polices   | +2 |


#### Expected output
Usage control is defined based on the IDSA Position Paper “[Data Usage Control in IDS](https://internationaldataspaces.org/data-sovereignty-updated-position-paper-on-data-usage-control-in-the-ids/)”. Usage control involves specifying and enforcing restrictions on what must (or must not) happen to data after access has been granted.

The test aims to evaluate which usage policies are supported out of the box. For those policies not natively supported, it should describe the effort needed to implement them and rank the system accordingly. For instance, creating a plugin within a documented environment is rated more favorably than integrating an external function that introduces dependencies and requires interface maintenance. The essential policies that need to be implemented are:

- **Allow-usage:** Always true or false.
- **Role-restricted:** Based on the role of the participant.
- **Location-restricted:** Based on the location of the consumer, typically "EU" or "Non-EU".

### Results
#### Assessment

Fiware connector by itself does not offer data usage control. However, a consumer restriction can be achieved by using the APISIX plugin consumer-restriction. This plugin allows users to configure access restrictions on Consumer, Route, Service, or Global Rule.

#### Measured results
**Functional Suitability Quality Metric: 0**

#### Notes
More information on the topic:
[https://apisix.apache.org/docs/apisix/plugins/consumer-restriction/](https://apisix.apache.org/docs/apisix/plugins/consumer-restriction/)

