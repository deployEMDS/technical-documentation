## [2.1.1.2] Data product publication: Provision - Data source endpoint provisioning
### Stack: Fiware

### Statement of assessment
#### Environment
[TODO] Describe the environment used for the test / assessment

#### Tested quality metric and method
[TODO] Describe the quality metric and method used for the test / assessment

#### Comparative criteria (checklists, ...)
[TODO] Describe the comparative criteria used for the test / assessment. If possible, align with the criteria used for the same test in the other stack(s).

#### Expected output
[TODO] Describe the expected output and how the ranking is calculated

### Results
#### Assessment
[TODO] Describe the assessment results (qualitative results), if applicable. Include screenshots, logs, etc, if necessary.

#### Measured results

Since the Fiware Connector uses Apache APISIX as a proxy between the incoming request and the data source, the data source endpoint can always be masked or obfuscated.

For all data sources, a route has to be created that routes the incoming request to the data source. The route can be used to mask the data source.

#### Notes
[TODO] Add notes, if necessary.
