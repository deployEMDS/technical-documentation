## [2.2.2.1] Data product publication: Publication - Deploy/config usage control functions
### Stack: EDC+VC

### Statement of assessment
#### Environment

EDC Connector v.0.7.1 within a local testbed.
The tests are available in [this](https://www.postman.com/i2cat-dev/workspace/deployemds) Postman workspace.

#### Tested quality metric and method

The following operations are tested via [API](https://app.swaggerhub.com/apis-docs/eclipse-edc-bot/management-api/0.7.1-SNAPSHOT#/Policy%20Definition%20V3)
- Upload a new policy
- Assign a policy to a sharing agreement
- Delete a policy
- Re-use an uploaded policy
- Persist uploaded policies

### Results
#### Assessment
##### [Upload a new policy](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-61667ac4-3166-4af9-9f57-56c94158f7b9?action=share&source=copy-link&creator=36812968&ctx=documentation)

Functional Suitability Quality Metric Score: 4

The policy is correctly created.

##### [Assign a policy to a sharing agreement](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-546d7ef3-d8b7-48c2-b5b2-83133f085b96?action=share&source=copy-link&creator=36812968&ctx=documentation)

Functional Suitability Quality Metric Score: 4

The policy is correctly assigned to a sharing agreement.

##### [Delete a policy](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-2d758baa-6e61-4024-b819-4877152ed24f?action=share&source=copy-link&creator=36812968&ctx=documentation)

Functional Suitability Quality Metric Score: 4

The policy is correctly deleted.

##### [Re-use an uploaded policy](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-194549c7-cdd5-4607-b434-ee5c06c72bae?action=share&source=copy-link&creator=36812968&ctx=documentation)

Functional Suitability Quality Metric Score: 4

The same policy can be reused for a different asset.

##### [Persist uploaded policies](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-7f4e568e-a989-425a-bd85-85e1f3f11aee?action=share&source=copy-link&creator=36812968&ctx=documentation)

Functional Suitability Quality Metric Score: 2

This is impossible to test with the current testbed setup.
Since EDC versions <0.7.1 supported persistence with an external database, the same behavior is expected for version 0.7.1.
Policies are “persisted” only if the Docker container with the connector is paused/resumed.
By stopping the container we lose the policies.
