## [2.1.1.5] Data product publication: Provision - Data source endpoint provisioning
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
[TODO] Describe the measured results (quantitative results), if applicable. Rank the results according to the expected output, if applicable.

#### Notes

The Apache APISIX gateway used to proxy communication to the data source offers various ways to activate rate limiting.

In general, rate limiting can simply be enabled for all routes or by matching rules on an e.g. per host or per URI basis.

There are many configurable ways to determine the limit, e.g. on a per request (leaky bucket), per concurrent request or request per time window basis.
