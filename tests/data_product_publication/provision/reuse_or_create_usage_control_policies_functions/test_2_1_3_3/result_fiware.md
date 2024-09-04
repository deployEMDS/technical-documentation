## [2.1.3.3] Data product publication: Provision - Reuse or create usage control policies / functions

### Stack: Fiware

### Statement of assessment

#### Environment

This functionality has been tested in the [IONOS Deployment](/deployment/fiware/fiware_deployment.md)

#### Tested quality metric and method

It was assessed if and how a policy can be sent to an EMDS policy repository (Github repository).

#### Comparative criteria (checklists, ...)



#### Expected output

A policy can be pushed and pulled to a Github repository. 

### Results

#### Assessment

For managing policies, the Fiware controller offers a Policy Administration and Information Point (PAP).

A administrator can add, query, update and delete policies on the PAP. Policies are created using the ODRL language and are basically JSON text files.

The [PAP Repo](https://github.com/wistefan/odrl-pap) contains [OpenAPI specification](https://github.com/wistefan/odrl-pap/blob/main/api/odrl.yaml) of its interface.

According to the specification, policies can be added and read using the API and policies are simple ODRL files in JSON format.

An administrator can therefore:
1. Pull policy templates from a central Github policy repository, adapt the policy and upload it to the PAP.
2. Query policies created in the PAP, download them, create a template out of the policy (removing deployment specific content) and push them as a template to the central Github policy repository.

#### Measured results

Functional Suitability Quality Metric Score: 4

#### Notes

