## [2.1.1.3] Data product publication: Provision - Data source endpoint provisioning
### Stack: EDC+VC

### Statement of assessment
#### Environment

EDC Connector v.0.7.1 within a local testbed

#### Tested quality metric and method
If an asset can represent a data source `X`, then data source `X` can be provisioned.

#### Expected output
Evaluate the level of support for the following data formats

- GTFS
- GTFS-RT
- DATEX-II
- DATX II Light
- GBFS
- WMS/WFS

Also access through APIs.

### Results
#### Assessment

The following data formats can be represented with an asset by the EDC Connector
- [X] GTFS
  - [Public dataset](https://opendata-ajuntament.barcelona.cat/data/dataset/c46503e3-cec6-4032-894d-1063b7a365ee/resource/1c92542e-0346-4df5-9824-d7753ab02e33/download), file transfer over HTTPS
- [ ] GTFS-RT (TODO)
- [ ] DATEX-II (TODO)
- [ ] DATX II Light (TODO)
- [ ] GBFS (TODO)
- [ ] WMS/WFS (TODO)

The following protocols can be used with an asset with the EDC Connector
- [ ] APIs
