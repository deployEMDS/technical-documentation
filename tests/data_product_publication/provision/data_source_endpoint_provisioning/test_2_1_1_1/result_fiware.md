## [2.1.1.1] Data product publication: Provision - Data source endpoint provisioning
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
A resource is accessed through the data plane, which is provided by the Apache APISIX component.

To get access to a resource, the consumer has to present her Verfifiable Presentation (VP) first. The VP is exchanged against an JWT data access token.

The data access token is sent in the HTTP request for the data source. The data access token is checked by the PEP component.

If the data access token is valid, according to pre configured OPA rules for the data resource, the request is being forwarded to the service serving the data resource.

The request is not changed when it passes the proxy. Therefore, any additional authentication information that is contained in the request, will be passed to the data source service and can be evaluated there. (TODO double-check with Gernot)
