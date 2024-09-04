## [5.2.1.1] Data sharing: Data sharing activities - Enforce usage control
### Stack: EDC+VC

### Statement of assessment
#### Environment
- The test utilizes the EDC MVD commit [8da0c4e](https://github.com/eclipse-edc/MinimumViableDataspace/commit/8da0c4e6a8921dcb6ff189c2901868979bdc9a93).
- EDC version [0.8.2-SNAPSHOT](https://github.com/eclipse-edc/MinimumViableDataspace/blob/8da0c4e6a8921dcb6ff189c2901868979bdc9a93/gradle/libs.versions.toml#L7)
- The test is executed in an Ubuntu environment using IntelliJ.

#### Tested quality metric and method
The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).\
For the current phase (phase 1), the test focuses on the Functional Suitability quality metric.

#### Comparative criteria (checklists, ...)
| Criteria           | Scoring          |
| ------------- | ------------- |
| No out of the box policies  | 0 |
| No out of the box policies but policies are available from a library  | 1 |
| Partial out-of-the-box-policies  | 2 |
| Full set of out-of-the-box policies  | 3 |
| Documented way to create/expand policies  | +1 |
| Documented way to create/expand policies + templates for basic polices   | +2 |


#### Expected Output
Usage control is defined based on the IDSA Position Paper “[Data Usage Control in IDS](https://internationaldataspaces.org/data-sovereignty-updated-position-paper-on-data-usage-control-in-the-ids/)”. Usage control involves specifying and enforcing restrictions on what must (or must not) happen to data after access has been granted.

The test aims to evaluate which usage policies are supported out of the box. For those policies not natively supported, it should describe the effort needed to implement them and rank the system accordingly. For instance, creating a plugin within a documented environment is rated more favorably than integrating an external function that introduces dependencies and requires interface maintenance. The essential policies that need to be implemented are:

- **Allow-usage:** Always true or false.
- **Role-restricted:** Based on the role of the participant.
- **Location-restricted:** Based on the location of the consumer, typically "EU" or "Non-EU".

### Results

#### Assessment

Usage control is not included in the EDC MVD commit [8da0c4e](https://github.com/eclipse-edc/MinimumViableDataspace/commit/8da0c4e6a8921dcb6ff189c2901868979bdc9a93). The policy engine embedded in the EDC solution, which processes ODRL (Open Digital Rights Language) policies, applies only to data access rights.

##### Implementation Gap

EDC has initiated a discussion to gather use cases for usage control [here](https://github.com/eclipse-edc/Connector/discussions/878), but there is no implementation from EDC at this time. 

IMEC has analyzed how usage control could be enforced. For example, a usage policy might specify that data must be deleted after 24 hours. If a consumer downloads a file from the provider connector to their S3 storage, trusted software can be implemented to monitor this storage (Policy Enforcement Point, or PEP). This software would automatically delete the data upon expiry and communicate this to the Policy Decision Point (PDP) and Policy Execution Point (PXP). The PDP or PXP can be part of the provider connector or communicate with connectors.

#### Measured results
As demonstrated above, there is no usage control feature currently implemented in the EDC development. As there is no implementation nor documentation, we cannot offer a +1 or +2 either. Therefore, the following score is given to the test:

**Functional Suitability Quality Metric: 0**

#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to create their own extensions.