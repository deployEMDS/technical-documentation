## [5.1.1.2] Data sharing: Data sharing request - Request data transfer
### Stack: EDC+VC

### Statement of assessment
#### Environment

EDC Connector v.0.7.1 within a local testbed.
The tests are available in [this](https://www.postman.com/i2cat-dev/workspace/deployemds) Postman workspace.

#### Expected output

Evaluate the support of a minimal data sharing for the following data formats

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

All the tests are stored under [this](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-ceed2125-10e2-48fa-91c9-8bf1f05aa7e8?action=share&source=copy-link&creator=36812968&ctx=documentation) folder.
A simple http server is used as destination of the artifact (consumer data plane). The server receives a file and logs its content in the standard output.
Note that while most artifacts point to plain text files, GTFS and GTFS-RT use binary files that can't be properly printed in standard output. This is not a limitation of the EDC+VC stack per se, but rather of the sample consumer data plane used in these tests, and thus this did not affect the evaluation score.

#### Measured results

| Test        | Functional Completeness | Functional Correctness	 | Functional Appropriateness | Explanation                                          |
|-------------|-------------------------|-------------------------|----------------------------|------------------------------------------------------|
| GTFS        | 4                       | 4                       | 4                          |  -       |
| GTFS-RT     | 3                       | 4                       | 4                          |  Can't perform queries against the data product       |
| DATEX-II    | 3                       | 4                       | 4                          |  Can't perform queries against the data product       |
| GBFS        | 3                       | 4                       | 4                          |  Can't perform queries against the data product       |
| WMS/WFS     | 3                       | 4                       | 4                          |  Can't perform queries against the data product       |
| Private key | 1                       | 1                       | 1                          | Transfer process status is TERMINATED, logs are empty |
| Overall     | (4+3*4+1)/6 = 2.83         | (4*5+1)/6 = 3.5         | (4*5+1)/6 = 3.5            |                                                       |

Overall score calculation: (2.83 + 3.5 + 3.5) / 3 = 3.28

**Functional Suitability Quality Metric Score: 3.28**


