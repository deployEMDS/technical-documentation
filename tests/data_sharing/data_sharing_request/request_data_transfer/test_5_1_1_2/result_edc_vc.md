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
[TODO] Describe the assessment results (qualitative results), if applicable. Include screenshots, logs, etc, if necessary.

#### Measured results
[TODO] Describe the measured results (quantitative results), if applicable. Rank the results according to the expected output, if applicable.

#### Notes
[TODO] Add notes, if necessary.
