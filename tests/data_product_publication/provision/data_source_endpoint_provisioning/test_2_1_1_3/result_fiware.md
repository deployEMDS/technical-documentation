## [2.1.1.3] Data product publication: Provision - Data source endpoint provisioning

### Stack: Fiware

### Statement of assessment

#### Environment

This functionality has been tested in the [IONOS Deployment](/deployment/fiware/fiware_deployment.md)

#### Tested quality metric and method



#### Comparative criteria (checklists, ...)



#### Expected output

Multiple protocols can be used in the data plane.

### Results

#### Assessment

The data plane in the Fiware Connector is realized with the Apache APISIX component. Therefore all protocols and schemes supported by APISIX can be used with the Fiware Connector.

APISIX supports multiple protocols:
- HTTP
- TCP/UDP
- SSL
- gRPC
- Kafka
- Redis

#### Measured results



#### Notes

In addition to the available protocols, new protocals can be added to APISIX, see [How to write your own protocol](https://apisix.apache.org/docs/apisix/xrpc/#how-to-write-your-own-protocol).
