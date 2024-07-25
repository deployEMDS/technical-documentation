## [4.2.3.2] Sharing agreement: Negotiation - Refusal or registration of sharing agreement
### Stack: EDC+VC

### Statement of assessment
#### Environment
- The test utilizes the EDC MVD commit [5d58b38](https://github.com/eclipse-edc/MinimumViableDataspace/commit/5d58b3871983ce00a69a38b3215c6a8cb67d8ced).
- The test is executed in an Ubuntu environment using IntelliJ.
#### Tested quality metric and method
The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). 
For current phase (phase 1), the test focus on the Functional suitability quality metric.

#### Comparative criteria (checklists, ...)
[TODO] Describe the comparative criteria used for the test / assessment. If possible, align with the criteria used for the same test in the other stack(s).

#### Expected output
The expected outcome of the current test is to evaluate whether the system provides an observability trace of the sharing agreement (privacy terms of observability are out of scope).

### Results
#### Assessment
The evaluation for this test case uses the following matrix:
- 0: No traceability
- 1: System logs, which record only a connection between two connectors using non-data space identifiers such as a public URL or IP address.
- 2: Application logs that include process information, for example, "Connector control plane initiating on port..."
- 3: Data space protocol status traces, such as "Data sharing agreement request"
- 4: Data space protocol transaction traces, for instance, "Contract ID Op: negotiation"
- 5: A complete data space protocol context dump, including the entire JSON dump with references.

#### Measured results
[TODO] Describe the measured results (quantitative results), if applicable. Rank the results according to the expected output, if applicable.

#### Notes
[TODO] Add notes, if necessary.
