## [5.1.1.1] Data sharing: Data sharing request - Request data transfer
### Stack: EDC+VC

### Statement of assessment
#### Environment
- The test utilizes the EDC MVD commit [8da0c4e](https://github.com/eclipse-edc/MinimumViableDataspace/commit/8da0c4e6a8921dcb6ff189c2901868979bdc9a93).
- EDC version [0.8.2-SNAPSHOT](https://github.com/eclipse-edc/MinimumViableDataspace/blob/8da0c4e6a8921dcb6ff189c2901868979bdc9a93/gradle/libs.versions.toml#L7)
- The test is executed in an Ubuntu environment using IntelliJ.

#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected Output

The test aims to provide a comprehensive evaluation of the following aspects:

- **Assess the Availability of the API:** Ensure that the API is accessible and functional.
- **Test Data Sharing Requests:** Verify that data sharing requests are correctly processed, covering these steps:
    - Initiating a data sharing request.
    - Retrieving information and status of the data sharing request.
    - Receiving the outcome of the data sharing request, including conditions.
    - Accessing information on past data sharing activities.
The system will score higher if the API is secured and utilizes standard methods, such as REST.


### Results
#### Assessment
EDC version [0.8.2-SNAPSHOT](https://github.com/eclipse-edc/MinimumViableDataspace/blob/8da0c4e6a8921dcb6ff189c2901868979bdc9a93/gradle/libs.versions.toml#L7) offers the following management API endpoints for managing data transfer processes:

- **POST** `/v3/transferprocesses`: Initiates a data transfer with specified parameters.
- **POST** `/v3/transferprocesses/request`: Returns all transfer processes that match a given query.
- **GET** `/v3/transferprocesses/{id}`: Retrieves a transfer process using the specified ID.
- **POST** `/v3/transferprocesses/{id}/deprovision`: Requests the deprovisioning of resources related to a transfer process.
- **POST** `/v3/transferprocesses/{id}/resume`: Requests the resumption of a suspended transfer process.
- **GET** `/v3/transferprocesses/{id}/state`: Retrieves the state of a transfer process using the specified ID.
- **POST** `/v3/transferprocesses/{id}/suspend`: Requests the suspension of a transfer process.
- **POST** `/v3/transferprocesses/{id}/terminate`: Requests the termination of a transfer process.

These endpoints, included in the EDC MVD commit [8da0c4e](https://github.com/eclipse-edc/MinimumViableDataspace/commit/8da0c4e6a8921dcb6ff189c2901868979bdc9a93), are secured using the EDC implementation of [Token-Based Authentication Service](https://github.com/eclipse-edc/Connector/tree/0bb741787fd0abc2a6a8a883a6fafdbf3b795c29/extensions/common/auth/auth-tokenbased). This service secures connector APIs and is configured with the key [EDC_API_AUTH_KEY](https://github.com/eclipse-edc/MinimumViableDataspace/blob/9a5f93c89cf5624cc4bf8eaa024a29da9b8e3d12/deployment/assets/env/consumer_connector.env#L15). EDC also provides an [AuthenticationService](https://github.com/eclipse-edc/Connector/blob/0bb741787fd0abc2a6a8a883a6fafdbf3b795c29/spi/common/auth-spi/src/main/java/org/eclipse/edc/api/auth/spi/AuthenticationService.java#L25) to integrate authentication protection into the APIs. Additionally, out-of-the-box extensions for authentication are available from EDC [here](https://github.com/eclipse-edc/Connector/tree/0bb741787fd0abc2a6a8a883a6fafdbf3b795c29/extensions/common/auth).

#### Measured results
As demonstrated above, all the following aspects of the transfer API coverage are fulfilled:

| Requirement | Measured KPI |
| -|--------------|
| Initiate a data sharing | 4            |
| Retrieve data sharing information and status | 3            |
| Receive data sharing request outcome condition | 3            |
| Retrieve data sharing information of past data sharing actions. | 3            |

**Overall Calculation: (4+3+3+3)/4 = 3.25**
Functional Suitability Quality Metric Score: 3.25

#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to create their own extensions.
