## [5.2.1.1] Data sharing: Data sharing activities - Enforce usage control
### Stack: EDC+VC

### Statement of assessment
#### Environment
- The test utilizes the EDC MVD commit [8da0c4e](https://github.com/eclipse-edc/MinimumViableDataspace/commit/8da0c4e6a8921dcb6ff189c2901868979bdc9a93).
- EDC version [0.8.2-SNAPSHOT](https://github.com/eclipse-edc/MinimumViableDataspace/blob/8da0c4e6a8921dcb6ff189c2901868979bdc9a93/gradle/libs.versions.toml#L7)
- The test is executed in an Ubuntu environment using IntelliJ.

#### Tested quality metric and method
The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).\
For current phase (phase 1), the test focuses on the Functional suitability quality metric.

#### Comparative criteria (checklists, ...)
[TODO] Describe the comparative criteria used for the test / assessment. If possible, align with the criteria used for the same test in the other stack(s).

#### Expected Output

The test aims to evaluate which usage policies are supported out of the box. For those policies not natively supported, it should describe the effort needed to implement them and rank the system accordingly. For instance, creating a plugin within a documented environment is rated more favorably than integrating an external function that introduces dependencies and requires interface maintenance. The essential policies that need to be implemented are:

- **Allow-usage:** Always true or false.
- **Role-restricted:** Based on the role of the participant.
- **Location-restricted:** Based on the location of the consumer, typically "EU" or "Non-EU".

### Results
#### Assessment
[TODO] Describe the assessment results (qualitative results), if applicable. Include screenshots, logs, etc, if necessary.

#### Measured results
[TODO] Describe the measured results (quantitative results), if applicable. Rank the results according to the expected output, if applicable.

#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to create their own extensions.