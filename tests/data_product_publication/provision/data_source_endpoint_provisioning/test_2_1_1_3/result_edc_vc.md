## [2.1.1.3] Data product publication: Provision - Data source endpoint provisioning
### Stack: EDC+VC

### Statement of assessment
#### Environment

EDC Connector v.0.7.1 within a local testbed.
The tests are available in [this](https://www.postman.com/i2cat-dev/workspace/deployemds) Postman workspace.

#### Tested quality metric and method
If an asset can represent a data source `X`, then data source `X` can be provisioned.

#### Expected output
Evaluate the level of support for the following data formats

- GTFS - [Public dataset](https://opendata-ajuntament.barcelona.cat/data/dataset/c46503e3-cec6-4032-894d-1063b7a365ee/resource/1c92542e-0346-4df5-9824-d7753ab02e33/download) with direct download via HTTPS
- GTFS-RT - [Public dataset](https://api.data.gov.my/gtfs-realtime/vehicle-position/ktmb/) via APIs
- DATEX-II - [Public dataset](https://opendata.emel.pt/cycling/biciparks?skip=1&limit=1) via APIs
- DATX II Light - No available datasets for this data format, tests are skipped
- GBFS - [Public dataset](https://opendata.emel.pt/cycling/biciparks?skip=1&limit=1) via APIs
- WMS/WFS - [Public dataset](https://openmaps.gov.bc.ca/geo/ows?SERVICE=WMS&REQUEST=GetCapabilities) via APIs

Also access through APIs.
Access to private APIs is tested using the AMB mobilitat endpoint.

### Results
#### Assessment

[Link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-777cf599-0621-46a5-93c5-455aa7ae508c?action=share&source=copy-link&creator=36812968&ctx=documentation)

##### GTFS

We can create an artifact with attribute `dataAddress.baseUrl` storing a URL to this resource.

Functional Suitability Quality Metric Score: 4

##### GTFS-RT

We can create an artifact with attribute `dataAddress.baseUrl` storing a URL to this resource.

Functional Suitability Quality Metric Score: 4

##### DATEX-II

We can create an artifact with attribute `dataAddress.baseUrl` storing a URL to this resource.

Functional Suitability Quality Metric Score: 4

##### GBFS

We can create an artifact with attribute `dataAddress.baseUrl` storing a URL to this resource.

Functional Suitability Quality Metric Score: 4

##### WMS/WFS

We can create an artifact with attribute `dataAddress.baseUrl` storing a URL to this resource.

Functional Suitability Quality Metric Score: 4

##### REST API + Api Key

We can create an artifact with
- Attribute `dataAddress.baseUrl` storing a URL
- Attribute `privateProperties.privateKey` storing an API key

Functional Suitability Quality Metric Score: 4
