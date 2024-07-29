## [2.2.2.1] Data product publication: Publication - Deploy/config usage control functions
### Stack: EDC+VC

### Statement of assessment
#### Environment

EDC Connector v.0.7.1 within a local testbed.
The tests are available in [this](https://www.postman.com/i2cat-dev/workspace/deployemds) Postman workspace.

#### Tested quality metric and method

The following operations are tested via [API](https://app.swaggerhub.com/apis-docs/eclipse-edc-bot/management-api/0.7.1-SNAPSHOT#/Policy%20Definition%20V3)
- Upload a new policy - Create an access policy, a contract policy and a policy to be delete later on.
- Re-use an uploaded policy - Specify another agreement that uses the same policy
- Persist uploaded policies - After creating the policies, restart the connector and check the policies are still there
- Delete a policy - Delete the policy specifically created to be deleted

### Results
#### Assessment
##### Upload a new policy [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-d8547997-65af-4e45-ac40-e2d3cdf98c88?action=share&source=copy-link&creator=36812968&ctx=documentation)]

The access policy and contract policy are correctly created.

Functional Suitability Quality Metric Score: 4

##### Re-use an uploaded policy [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-59934389-3d3a-415a-9276-555e4c9c4172?action=share&source=copy-link&creator=36812968&ctx=documentation)]

The same policy can be reused for a different asset.
We have to assign both an access policy and a contract policy to a contract definition.

Functional Suitability Quality Metric Score: 3

##### Persist uploaded policies [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-d8173b27-a951-4718-beba-2ff922c8bc19?action=share&source=copy-link&creator=36812968&ctx=documentation)]

By default, the connector doesn't persist data.
Enabling this feature requires proper configuration, which we have not yet been able to achieve.
So by stopping the container, we lose the policies.

Functional Suitability Quality Metric Score: 2

##### Delete a policy [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-5b7e3beb-18c7-40a9-b91c-93b701d92fec?action=share&source=copy-link&creator=36812968&ctx=documentation)]

The policy is correctly deleted.

Functional Suitability Quality Metric Score: 4

