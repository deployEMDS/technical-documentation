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
- DATX II Light - None
- GBFS - [Public dataset](https://opendata.emel.pt/cycling/biciparks?skip=1&limit=1) via APIs
- WMS/WFS - [Public dataset](https://openmaps.gov.bc.ca/geo/ows?SERVICE=WMS&REQUEST=GetCapabilities) via APIs

Also access through APIs.

### Results
#### Assessment
##### GTFS [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/collection/36812968-1f42e195-aab4-4440-8302-3cd544a0a030?action=share&creator=36812968)]

We can create an artifact with attribute `dataAddress.baseUrl` storing a URL to this resource.

Functional Suitability Quality Metric Score: 4

##### GTFS-RT [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/collection/36812968-af4dfd50-c823-4069-b335-f01a503d4e3f?action=share&creator=36812968)]

We can create an artifact with attribute `dataAddress.baseUrl` storing a URL to this resource.

Functional Suitability Quality Metric Score: 4

##### DATEX-II [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/collection/36812968-069098d6-b5f1-4f2a-8be3-aef8ccfee9cc?action=share&creator=36812968)]

We can create an artifact with attribute `dataAddress.baseUrl` storing a URL to this resource.

Functional Suitability Quality Metric Score: 4

##### DATX II Light [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/collection/36812968-f437f62e-4784-45a8-9a4d-5e571efc45d1?action=share&creator=36812968)]

Since artifacts simply store a URL to a resource, this is expected to work.
However, this has not been tested since no DATX II Light has been found yet.

Functional Suitability Quality Metric Score: 2

##### GBFS [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/collection/36812968-acad1256-9871-448b-8883-feed3704a269?action=share&creator=36812968)]

We can create an artifact with attribute `dataAddress.baseUrl` storing a URL to this resource.

Functional Suitability Quality Metric Score: 4

##### WMS/WFS [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/collection/36812968-f34c9167-094b-47ec-b7bf-1e93115abb4d?action=share&creator=36812968)]

We can create an artifact with attribute `dataAddress.baseUrl` storing a URL to this resource.

Functional Suitability Quality Metric Score: 4

##### REST API + Api Key
