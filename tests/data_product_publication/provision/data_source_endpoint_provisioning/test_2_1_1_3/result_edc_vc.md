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

The EDC-VC stack fully supports all 6 types of data planes explained in this test. As such, it is evaluated with the highest score in each of the criteria used to evaluate this test as shown in the table below.

| **Criterion**                | **Description**                                                                                     | **Score (0-4)** | **Explanation** |
|------------------------------|-----------------------------------------------------------------------------------------------------|-----------------|-------------|
| **Functional Completeness**   | Technical requirements cover all the specified tasks and user objectives.                          | 4               | Artifacts can store a URL to any file format. The URL is stored by setting the field `dataAddress.baseUrl`. |
| **Functional Correctness**    | Technical requirements meet results with the needed degree of precision.                           | 4               | Both publicly-accessible as well as private artifacts are supported. For the latter, different authentication methods are also provided, such as access through API keys which is supported through the attribute `privateProperties.privateKey` |
| **Functional Appropriateness**| Technical requirements facilitate the accomplishment of specified tasks and objectives.            | 4               | All artifacts were created easily through a single API call passing the required information. |

Overall score calculation: (4 + 4 + 4) / 3 = 4

**Functional Suitability Quality Metric Score: 4**
