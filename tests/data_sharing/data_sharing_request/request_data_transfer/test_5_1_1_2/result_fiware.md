## [5.1.1.2] Data sharing: Data sharing request - Request data transfer
### Stack: Fiware

### Statement of assessment
#### Environment


#### Tested quality metric and method

The respective issue [#258](https://github.com/imec-int/deployEMDS/issues/285) additionally mentions the following protocols to be tested:
    GTFS
    GTFS-RT
    DATEX-II
    DATX II Light
    GBFS
    WMS/WFS


#### Comparative criteria (checklists, ...)

#### Expected output

Regarding the protocols mentioned in [#258](https://github.com/imec-int/deployEMDS/issues/285), all these protocols describe the data format. Eg. GTFS provides data in a zip file and the file contains multiple text files in a comma separated style. Or e.g. GBFS specifies the data format to be Json.

None of the protocol specifies a data exchange protocol other then HTTP GET requests. Since data sources can be naturally provided with an HTTP Proxy like APISIX, the Fiware connector supports all of these formats.

### Results
#### Assessment


#### Measured results

| Characteristic | Score |
|-|-|
| Functional completeness | 4 |
| Functional correctness | 4 |
| Functional appropriateness | 4 |
| Total | 4 |

Functional Suitability Quality Metric Score: 4

#### Notes
