## [2.1.1.2] Data product publication: Provision - Data source endpoint provisioning

### Stack: Fiware

### Statement of assessment

#### Environment

This functionality has been tested in the [IONOS Deployment](/deployment/fiware/fiware_deployment.md)

#### Tested quality metric and method

It was tested if provided resources can be masked behind the connector.

#### Comparative criteria (checklists, ...)

None

#### Expected output

The resource can be masked.

### Results

#### Assessment

Since the Fiware Connector uses Apache APISIX as a proxy between the incoming request and the data source, the data source endpoint can always be masked or obfuscated.

For all data sources, a route has to be created that routes the incoming request to the data source. The route can be used to mask the data source.

#### Measured results

#### Notes
