## [2.1.1.3] Data product publication: Provision - Data source endpoint provisioning
### Stack: SIMPL

### Statement of assessment
#### Environment

The testing environment is an IMEC self-deployed instances of [Simpl-Open](https://code.europa.eu/simpl/simpl-open) on
an IONOS Kubernetes cluster, the version used is 1.0.

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1,
the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

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
[Simpl-Open](https://code.europa.eu/simpl/simpl-open) uses the EDC connector to implement the [Dataspace Protocol](https://docs.internationaldataspaces.org/ids-knowledgebase/dataspace-protocol). 
The HttpData Plane used in the EDC test for all the above formats is also integrated into [Simpl-Open](https://code.europa.eu/simpl/simpl-open).

Therefore, from a functional perspective, [Simpl-Open](https://code.europa.eu/simpl/simpl-open) supports the above formats as the EDC connector does. 

However, the main implementation of SIMPL for data space focuses on user interface facilities.
The current built-in data offering template checks for IonosS3 storage data address, not HttpData. 

But the above resources can be stored in and consumer to IonosS3: [edc-ionos-s3](https://github.com/Digital-Ecosystems/edc-ionos-s3/tree/main) without any problem.

#### Measured results

The SIMPL stack fully supports all six types of data planes, same to the EDC, as explained in this test. Consequently, it is evaluated with the highest score in each of the criteria used to evaluate this test, as shown in the table below.

| **Criterion**                | **Description**                                                                                     | **Score (0-4)** | **Explanation**                                                                  |
|------------------------------|-----------------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------|
| **Functional Completeness**   | Technical requirements cover all the specified tasks and user objectives.                          | 4               | Artifacts can store a URL to any file format, and the file is stored in S3 storage. |
| **Functional Correctness**    | Technical requirements meet results with the needed degree of precision.                           | 4               | The S3 storage can be easily configured for providing and consuming data.        |
| **Functional Appropriateness**| Technical requirements facilitate the accomplishment of specified tasks and objectives.            | 4               | The data plane is well implemented for data transfer.                             |

**Functional Suitability Quality Metric Score: 4**
#### Notes
The current testing version of SIMPL is a very basic Minimum Viable Product solution, version 1.0.   