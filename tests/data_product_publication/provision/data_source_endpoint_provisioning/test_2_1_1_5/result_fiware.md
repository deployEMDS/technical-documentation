## [2.1.1.5] Data product publication: Provision - Data source endpoint provisioning

### Stack: Fiware

### Statement of assessment

#### Environment

This functionality has been tested in the [IONOS Deployment](/deployment/fiware/fiware_deployment.md)

#### Tested quality metric and method


#### Comparative criteria (checklists, ...)


#### Expected output

QoS and Rate Limiting can be configured for the data plane.

### Results

#### Assessment

The Apache APISIX gateway used to proxy communication to the data source offers various ways to activate rate limiting.

In general, rate limiting can simply be enabled for all routes or by matching rules on an e.g. per host or per URI basis.

There are many configurable ways to determine the limit, e.g. on a per request (leaky bucket), per concurrent request or request per time window basis.

#### Measured results


#### Notes