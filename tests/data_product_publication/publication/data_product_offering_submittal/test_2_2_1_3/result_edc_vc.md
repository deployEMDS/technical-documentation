## [2.2.1.3] Data product publication: Publication - Data product offering submittal
### Stack: EDC+VC

### Statement of assessment
#### Environment

EDC Connector v.0.7.1 within a local testbed.
The tests are available in [this](https://www.postman.com/i2cat-dev/workspace/deployemds) Postman workspace.

#### Tested quality metric and method

Has the data producer access (via GUI or API) to overviews of

- Data products offerings
- Sharing agreements
- Available data planes

### Results
#### Assessment

- Data products offerings [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-9ce34b1f-3a11-4a19-b73c-46c332e5e165?action=share&source=copy-link&creator=36812968&ctx=documentation)]
- Contract agreements [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-a8a150be-50d8-471b-a80b-dab2c61861fb?action=share&source=copy-link&creator=36812968&ctx=documentation)]
- Catalog [[link to Postman](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-6b36ee62-0cec-49c1-b34a-b1f7dd74ed6b?action=share&source=copy-link&creator=36812968&ctx=documentation)]
- Transfer processes [[link to Postman](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-163f8f41-97e1-42be-8331-b1bf29974068?action=share&source=copy-link&creator=36812968&ctx=documentation)]
- Available data planes [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-045542a4-413c-4924-b045-4433d125c2e5?action=share&source=copy-link&creator=36812968&ctx=documentation)]
- Contract definitions [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-5d66388c-db0b-4cb6-977a-4a0f6c91d4f4?ctx=documentation)]
- Contract negotiations [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-f1a36521-ac88-4e97-85a1-49326f712596?ctx=documentation)]

#### Measured results

The EDC-VC stack fully supports all the actions tested above through simple API calls. However, it lacks out-of-the-box support for a GUI that facilitates access to this information in a user friendly manner. As such, it is evaluated with the scores of the criteria used to evaluate this test as shown in the table below.

| **Criterion**                | **Description**                                                                                     | **Score (0-4)** | **Explanation** |
|------------------------------|-----------------------------------------------------------------------------------------------------|-----------------|-------------|
| **Functional Completeness**   | Technical requirements cover all the specified tasks and user objectives.                          | 4               | The data producer can see an overview of all the collections loaded into the connector via API. |
| **Functional Correctness**    | Technical requirements meet results with the needed degree of precision.                           | 4               | The connector corrently returns information about all the collections loaded into the connector via API. |
| **Functional Appropriateness**| Technical requirements facilitate the accomplishment of specified tasks and objectives.            | 2               | The connector does not have out-of-the-box support for a GUI to access the overview information. |

**Functional Suitability Quality Metric Score: 3**
