## [2.1.1.1] Data product publication: Provision - Data source endpoint provisioning

### Stack: Fiware

### Statement of assessment

#### Environment

This functionality has been tested in the [IONOS Deployment](/deployment/fiware/fiware_deployment.md)

#### Tested quality metric and method

It was tested to access a resource with/without authentication.

#### Comparative criteria (checklists, ...)

A resource is accessed through the data plane, which is provided by the Apache APISIX component.

To get access to a resource, the consumer has to present her Verfifiable Presentation (VP) first. The VP is exchanged against a JWT data access token.

The current setup is configured to work with the VP way of authentication. Whilst APISIX as a proxy is supporting other authentication mechanisms as well. This way has been tested to test compliance with decentralized SSI authentication methods required e.g. by Gaia-X.

#### Expected output

Only authenticated requests are permitted.

### Results

#### Assessment

The data access token is sent in the HTTP request for the data source. The data access token is checked by the PEP component.

If the data access token is valid, according to pre configured OPA rules for the data resource, the request is being forwarded to the service serving the data resource.

#### Measured results

No measurements have been made.

#### Notes

The request is not changed when it passes the proxy. Therefore, any additional authentication information that is contained in the request, will be passed to the data source service and can be evaluated there. (TODO double-check with Gernot)

The rules for checking the access token and therefore permitting/denying access can be configured in the VCVerifier.