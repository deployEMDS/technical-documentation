## [2.2.2.1] Data product publication: Publication - Deploy/config usage control functions
### Stack: Fiware

### Statement of assessment
#### Environment

The test is conducted in the IONOS FIWARE_cluster cluster using node pool IP 85.215.161.198.

#### Tested quality metric and method

The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). For the current phase (phase 1), the test focuses on the Functional Suitability quality metric.

#### Comparative criteria 

1. Policy creation
2. Policy binding with custom enforcement function
3. Policy assignment to sharing agreement
4. Policy deletion
5. Policy re-use 
6. Policy persistance of uploaded policies

#### Expected output

The expected output of the test is an assessment of the completeness of the administrative interface (either API or GUI) so that it covers the most needed use cases for the deployment of usage policies.

### Results
#### Assessment

#### 1. Policy Creation

The creation of usage control policy for NGSI-LD resource is created using the following command: 

```
curl -s -X POST http://odrl-pap.demo-portal.eu/policy \

    -H 'Content-Type: application/json' \

    -d  '{

            "@context": {

              "dc": "http://purl.org/dc/elements/1.1/",

              "dct": "http://purl.org/dc/terms/",

              "owl": "http://www.w3.org/2002/07/owl#",

              "odrl": "http://www.w3.org/ns/odrl/2/",

              "rdfs": "http://www.w3.org/2000/01/rdf-schema#",

              "skos": "http://www.w3.org/2004/02/skos/core#"

            },

            "@id": "https://mp-operation.org/policy/common/type",

            "@type": "odrl:Policy",

            "odrl:permission": {

              "odrl:assigner": {

                "@id": "https://www.mp-operation.org/"

              },

              "odrl:target": {

                "@type": "odrl:AssetCollection",

                "odrl:source": "urn:asset",

                "odrl:refinement": [

                  {

                    "@type": "odrl:Constraint",

                    "odrl:leftOperand": "ngsi-ld:entityType",

                    "odrl:operator": {

                      "@id": "odrl:eq"

                    },

                    "odrl:rightOperand": "EnergyReport"

                  }

                ]

              },

              "odrl:assignee": {

                "@id": "odrl:any"

              },

              "odrl:action": {

                "@id": "odrl:read"

              }

            }

          }'
```

The policy allows the organization "odrl:any" to "read"(e.g. GET) the entity:
```json
            {
                "@type": "odrl:AssetCollection",
                "odrl:source": "urn:asset",
                "odrl:refinement": [
                  {
                    "@type": "odrl:Constraint",
                    "odrl:leftOperand": "ngsi-ld:entityType",
                    "odrl:operator": {
                      "@id": "odrl:eq"
                    },
                    "odrl:rightOperand": "EnergyReport"
                  }
                ]
            },
```

Fiware connector aims to take ODRL Policies and execute them using the Open Policy Agent.


To get all policies use the following command:

    curl -s -X GET http://odrl-pap.demo-portal.eu/policy



To get a specific policy use the command:

    curl -s -X GET http://odrl-pap.demo-portal.eu/policy/{policy_id}

#### 2. Policy binding with custom enforcement function

There are two ways:

a) with custom odrl-pap rules: https://github.com/FIWARE/helm-charts/blob/main/charts/odrl-pap/values.yaml#L195-L228

b) with one individual APISIX plugins of the many available to be activated in a route, but this would be valid for all traffic/customers, e.g.  https://apisix.apache.org/docs/apisix/plugins/limit-req/

#### 3. Policy assignment to sharing agreement
This will be activated with the TMForum/Marketplace addition. 



#### 4. Policy deletion

Yes. The command used is: 

    curl -s -X DELETE http://odrl-pap.demo-portal.eu/policy/{policy_id}}


#### 5. Policy re-use
Yes, but it depends on the policy. If you have a policy like our current EnergyReport policy, then the policy will also be enforced to new data that is matching the criteria like having the entitytype=EnergyReport because many entities can have this more generic filter criteria. If you have a more specific policy like entityID=XYZ, this will exclude new data bacause entityID is unique. 
However, there are no such standalone policies like in EDC to be attached manually to data offers and to be reused manually in other data offers. 

#### 6. Policy persistance of uploaded policies
Policy data is persisted in a database and managed via API:
https://github.com/FIWARE-Ops/data-space-connector/blob/adbb9488d8865703af02cf47dc571548c8d230bd/charts/data-space-connector/values.yaml#L137

#### Measured results
The Fiware implementation partially covers the usage Control Policies deployment as outlined above. The criteria used to measure the results was the one specified by the Data Product Publication ISO25010 Quality file regarding Functional Suitability.

| **Criterion**                | **Description**                                                                                     | **Score (0-4)** |
|------------------------------|-----------------------------------------------------------------------------------------------------|-----------------|
| **Functional Completeness**   | Technical requirements cover all the specified tasks and user objectives.                          | 3               |
| **Functional Correctness**    | Technical requirements meet results with the needed degree of precision.                           | 3               |
| **Functional Appropriateness**| Technical requirements facilitate the accomplishment of specified tasks and objectives.            | 3               |


**Overall score: 3**
#### Notes
