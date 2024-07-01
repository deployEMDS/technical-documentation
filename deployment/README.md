This folder contains the artifacts used to deploy the data space technology stacks of each testing facility.

In case the deployment is automated using infrastructure as code, a possible structure of an environment could be:

```
.
|-- Environment (testing facility)
| |-- main module
| |-- modules
| |- configuration
| |- artifacts
```

If the environment is deployed manually, instead:
```
.
|-- * Environment (testing facility)
| |-- deployment logs
| | |-- Log1
| | |-- Log2
| | |-- ...
| |-- scripts
| |-- libs
| |-- configurations
| |-- artifacts
```

In general, with the content of this folder, one should be able to replicate the deployment. In a not-so distant future the deployment assets will be streamlined to create a standard EMDS environment for each participant.

The project’s infrastructure is hosted on IONOS’ Virtual data center (https://docs.ionos.com/cloud/getting-started/data-center-designer), which is a Kubernetes-based IaaS service. 

IONOS provides also several PaaS services, e.g., DB as a service, DNS… If these are used in a test facility, their configuration must also appear here.
