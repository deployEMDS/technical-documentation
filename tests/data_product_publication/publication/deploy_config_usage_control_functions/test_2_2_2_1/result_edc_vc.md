## [2.2.2.1] Data product publication: Publication - Deploy/config usage control functions
### Stack: EDC+VC

### Statement of assessment
#### Environment

EDC Connector v.0.7.1 within a local testbed.
The tests are available in [this](https://www.postman.com/i2cat-dev/workspace/deployemds) Postman workspace.

#### Tested quality metric and method

The following operations are tested via [API](https://app.swaggerhub.com/apis-docs/eclipse-edc-bot/management-api/0.7.1-SNAPSHOT#/Policy%20Definition%20V3)
- Upload a new policy - Create an access policy, a contract policy and a policy to be delete later on.
- Assign a policy to a sharing agreement - Create a sharing agreement with an access policy, one with a contract policy ad one with both.
- Re-use an uploaded policy - Specify another agreement that uses the same policy
- Persist uploaded policies - After creating the policies, restart the connector and check the policies are still there
- Delete a policy - Delete the policy specifically created to be deleted

### Results
#### Assessment
##### Upload a new policy [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-61667ac4-3166-4af9-9f57-56c94158f7b9?action=share&source=copy-link&creator=36812968&ctx=documentation)]

The access policy and contract policy are correctly created.

Functional Suitability Quality Metric Score: 4

##### Assign a policy to a sharing agreement [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-546d7ef3-d8b7-48c2-b5b2-83133f085b96?action=share&source=copy-link&creator=36812968&ctx=documentation)]

We have to assign both an access policy and a contract policy to a contract definition.

Functional Suitability Quality Metric Score: 3

##### Re-use an uploaded policy [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-194549c7-cdd5-4607-b434-ee5c06c72bae?action=share&source=copy-link&creator=36812968&ctx=documentation)]

The same policy can be reused for a different asset.

Functional Suitability Quality Metric Score: 4

##### Persist uploaded policies [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-7f4e568e-a989-425a-bd85-85e1f3f11aee?action=share&source=copy-link&creator=36812968&ctx=documentation)]

By default, the connector doesn't persist data.
Enabling this feature requires proper configuration, which we have not yet been able to achieve.
So by stopping the container, we lose the policies.

Functional Suitability Quality Metric Score: 2

##### Delete a policy [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-2d758baa-6e61-4024-b819-4877152ed24f?action=share&source=copy-link&creator=36812968&ctx=documentation)]

The policy is correctly deleted.

Functional Suitability Quality Metric Score: 4

