## [2.1.1.4] Data product publication: Provision - Data source endpoint provisioning

### Stack: Fiware

### Statement of assessment

#### Environment



#### Tested quality metric and method

Load balancing is one of the standard features of APISIX.

#### Comparative criteria (checklists, ...)



#### Expected output

Data sources can be load balanced.

### Results

#### Assessment

Since the Fiware Controller uses Apache APISIX proxy in the data plane, it natively supports load balancing in its data source endpoint configuration.

Documentation can be consulted here: [Load Balancing](https://apisix.apache.org/docs/apisix/getting-started/load-balancing/)

#### Measured results


#### Notes