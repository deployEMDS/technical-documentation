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
- Bind a custom control function  to a policy or an operator (see corresponding paragraph).

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
From the [connector developers documentation](https://github.com/eclipse-edc/Connector/blob/0bb741787fd0abc2a6a8a883a6fafdbf3b795c29/docs/developer/default_provider_methods.md?plain=1#L21)

> Fallbacks are meant as safety net, in case developers forget or don't want to add a specific implementation for a service. It is there so as not to end up _without_ an implementation for a service interface. A good example for this are in-memory store implementations. It is expected that an actual persistence implementation is contributed by another extension.

So by stopping the container, we lose the policies.

Functional Suitability Quality Metric Score: 2

##### Delete a policy [[link to Postman tests](https://www.postman.com/i2cat-dev/workspace/deployemds/folder/36812968-5b7e3beb-18c7-40a9-b91c-93b701d92fec?action=share&source=copy-link&creator=36812968&ctx=documentation)]

The policy is correctly deleted.

Functional Suitability Quality Metric Score: 4

##### Bind a custom constraint function to a policy [[Link to EDC documentation](https://github.com/eclipse-edc/Connector/blob/main/docs/developer/policy-engine.md)]

A custom constraint function is implicitely bound to a named operator, the interface is the same as the policy upload, provided the custom operator is used. The mechanism makes for a light administrative workload, but it requires knowledge of custom developed policies (i.e., there is no directory of available policies).

Functional Suitability Quality Metric Score: 3

#### Cumulative measured results
The EDC implementation partially covers the deployment cyclus of Usage Control Policies, as described in the test requirements.
**Functional Suitability Quality Metric Score: 3,2**

#### Notes