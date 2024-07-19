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

- [X] Upload a new policy
- [X] Assign a policy to a sharing agreement
- [X] Delete a policy
- [X] Re-use an uploaded policy
- [ ] Persist uploaded policies
  - Impossible to test with the current testbed setup.
  Policies are “persisted” only if the Docker container with the connector is paused/resumed.
  By stopping the container we lose the policies.
