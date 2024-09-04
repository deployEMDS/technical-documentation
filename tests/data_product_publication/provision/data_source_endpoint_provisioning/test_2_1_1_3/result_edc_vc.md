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

All the tests are stored under [this folder](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-777cf599-0621-46a5-93c5-455aa7ae508c?action=share&source=copy-link&creator=36812968&ctx=documentation).
A single, parameterized call is used for the entire batch of tests.
Execute this tests by running the entire folder at once.

#### Measured results

The criteria used to measure the results was the one specified by the Data Product Publication ISO25010 Quality file regarding Functional Suitability.

Criteria | Scoring
-- | --
No data planes supported out of the box, and no possibility to develop others | 0
No data planes supported out of the box, but they can be developed ad-hoc. Coverage unknown | 1
1 or 2 data planes covered out of the box | 2
3 data planes covered out of the box | 3
4 or 5 data planes covered out of the box | 4
Ad-hoc customization of existing data plane(s) is possible (through configuration, not code) without having to build a new one | +1

| **Assessment**              | **Functional Completeness** | **Functional Correctness** | **Functional Appropriateness**  | **Explanation**                                                                                                                                               |
|-----------------------------|----------------------------|----------------------------|---------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **GTFS**                    | 4                          | 4                          | 4                               | Artifacts can store a URL to any file format. The URL is stored by setting the field `dataAddress.baseUrl`.                                                    |
| **GTFS-RT**                 | 4                          | 4                          | 4                               | Artifacts can store a URL to any file format. The URL is stored by setting the field `dataAddress.baseUrl`.                                                    |
| **DATEX-II**                | 4                          | 4                          | 4                               | Artifacts can store a URL to any file format. The URL is stored by setting the field `dataAddress.baseUrl`.                                                    |
| **GBFS**                    | 4                          | 4                          | 4                               | Artifacts can store a URL to any file format. The URL is stored by setting the field `dataAddress.baseUrl`.                                                    |
| **WMS/WFS**                 | 4                          | 4                          | 4                               | Artifacts can store a URL to any file format. The URL is stored by setting the field `dataAddress.baseUrl`.                                                    |
| **REST API + API Key**       | 4                          | 4                          | 4                               | Artifacts can store a URL to any file format. The URL is stored by setting the field `dataAddress.baseUrl`, and attribute `privateProperties.privateKey` can store an API key. |

Functional Suitability Quality Metric Score: 4
