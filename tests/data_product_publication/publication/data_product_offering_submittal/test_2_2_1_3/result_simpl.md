## [2.2.1.3] Data product publication: Publication - Data product offering submittal
### Stack: SIMPL

### Statement of assessment
#### Environment

The testing environment is an IMEC self-deployed instances of [Simpl-Open](https://code.europa.eu/simpl/simpl-open) on
an IONOS Kubernetes cluster, the version used is 1.0.

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1,
the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
The test aims to assess if the administrative interface of the connector provides overviews of data products, data sharing agreements, available data planes and the status of these assets.

### Results
#### Assessment
[Simpl-Open](https://code.europa.eu/simpl/simpl-open) uses the EDC connector's management API implementation. Therefore, for API access, SIMPL has the same results as detailed in [result_edc_vc.md](result_edc_vc.md).

The main feature of SIMPL is its user interfaces, which facilitate the creation and management of data offerings, such as the [catalog UI](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-catalogue-client) and [SIMPL Self Description UI](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-sd-ui).

These UIs support functions for creating data products, negotiating (with status), and transferring (with status). However, the UIs have very basic functional implementations. They do not provide functionality for checking available data planes. Users cannot log in or out with proper URL redirection, there is no session management, no deletion of data products, and no historical review of negotiations and transfers.

#### Measured results
The current test is evaluated based on SIMPL's user interfaces. as it is its main contribution to the Dataspace ecosystem. Therefore, it is assessed using the criteria scores shown in the table below.

| **Criterion**                | **Description**                                                                                     | **Score (0-4)** | **Explanation**                                                                                  |
|------------------------------|-----------------------------------------------------------------------------------------------------|-----------------|--------------------------------------------------------------------------------------------------|
| **Functional Completeness**   | Technical requirements cover all the specified tasks and user objectives.                          | 2               | The basic cycle of data products is covered in the user interfaces.                              |
| **Functional Correctness**    | Technical requirements meet results with the needed degree of precision.                           | 2               | The SIMPL user interfaces can manage data products, but many functions are missing as explained. |
| **Functional Appropriateness**| Technical requirements facilitate the accomplishment of specified tasks and objectives.            | 2               | SIMPL provides user interfaces with limited functionality.                                       |

Overall score calculation: (2 + 2 + 2) / 3 = 2

**Functional Suitability Quality Metric Score: 2**


#### Notes
The current testing version of SIMPL is a very basic Minimum Viable Product solution, version 1.0.   