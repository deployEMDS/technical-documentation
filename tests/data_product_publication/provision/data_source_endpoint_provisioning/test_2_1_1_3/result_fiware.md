## [2.1.1.3] Data product publication: Provision - Data source endpoint provisioning
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

The data plane in the Fiware Connector is realized with the Apache APISIX component. Therefore all protocols and schemes supported by APISIX can be used with the Fiware Connector.

APISIX supports multiple protocols:
- HTTP
- TCP/UDP
- SSL
- gRPC
- Kafka
- redis


In addition, new protocals can be added to APISIX, see [How to write your own protocol](https://apisix.apache.org/docs/apisix/xrpc/#how-to-write-your-own-protocol).

[TODO] Describe the measured results (quantitative results), if applicable. Rank the results according to the expected output, if applicable.

#### Notes
[TODO] Add notes, if necessary.
