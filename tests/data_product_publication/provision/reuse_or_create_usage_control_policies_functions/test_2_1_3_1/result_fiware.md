## [2.1.3.1] Data product publication: Provision - Reuse or create usage control policies / functions

### Stack: Fiware

### Statement of assessment

#### Environment

This functionality has been tested in the [IONOS Deployment](/deployment/fiware/fiware_deployment.md)


#### Tested quality metric and method

It was assesed if standard create, read, update and delete (CRUD) functionality is available for policies.

#### Comparative criteria (checklists, ...)


#### Expected output

It is assumed that basic functionality is available.

### Results

#### Assessment

For managing policies, the Fiware controller offers a Policy Administration and Information Point (PAP).

A administrator can add, query, update and delete policies on the PAP. Policies are created using the ODRL language and are basically JSON text files.

The [PAP Repo](https://github.com/wistefan/odrl-pap) contains [OpenAPI specification](https://github.com/wistefan/odrl-pap/blob/main/api/odrl.yaml) of its interface.

The API provides the basic functionality expected.

#### Measured results

4

#### Notes