## [2.1.3.4] Data product publication: Provision - Reuse or create usage control policies / functions

### Stack: Fiware

### Statement of assessment

#### Environment

This functionality has been tested in the [IONOS Deployment](/deployment/fiware/fiware_deployment.md)

#### Tested quality metric and method

It was tested if multiple policies can be added to a resource.

To create a policy, multiple policies have been sent to PAP component using the POST /policy endpoint.

To check what policies are assigned to a resource, a GET request was send to /policy.

#### Comparative criteria (checklists, ...)


#### Expected output

The GET request to the /policy endpoint returns multiple policies assigned to one resource.

### Results

#### Assessment

Policies can be created with a statement like the following:
```
curl --location --request POST 'http://odrl-pap.fiwareconnector.de/policy' \
--header 'Content-Type: application/json' \
--data-raw '{
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
                "@id": "admin@provider.org"
              },
              "odrl:action": {
                "@id": "odrl:read"
              }
            }
          }'
```

Within the policy, the resource is contained in the target section.

Multiple policies targeting the same resource can be created.

To get all policies, the following request can be sent to the PAP:
```
curl --location --request GET 'http://odrl-pap.anneundsebp.de/policy'
```

The following example response shows that multiple policies can be attached to one resource (in the example, two users are given read permission to the resource):

```
[
    {
        "id": "dchbsrecgp",
        "odrl": "{\"@context\":{\"dc\":\"http://purl.org/dc/elements/1.1/\",\"dct\":\"http://purl.org/dc/terms/\",\"owl\":\"http://www.w3.org/2002/07/owl#\",\"odrl\":\"http://www.w3.org/ns/odrl/2/\",\"rdfs\":\"http://www.w3.org/2000/01/rdf-schema#\",\"skos\":\"http://www.w3.org/2004/02/skos/core#\"},\"@id\":\"https://mp-operation.org/policy/common/type\",\"@type\":\"odrl:Policy\",\"odrl:permission\":{\"odrl:assigner\":{\"@id\":\"https://www.mp-operation.org/\"},\"odrl:target\":{\"@type\":\"odrl:AssetCollection\",\"odrl:source\":\"urn:asset\",\"odrl:refinement\":[{\"@type\":\"odrl:Constraint\",\"odrl:leftOperand\":\"ngsi-ld:entityType\",\"odrl:operator\":{\"@id\":\"odrl:eq\"},\"odrl:rightOperand\":\"EnergyReport\"}]},\"odrl:assignee\":{\"@id\":\"admin@provider.org\"},\"odrl:action\":{\"@id\":\"odrl:read\"}}}",
        "rego": "package policy.dchbsrecgp\n\nimport data.odrl.operand as odrl_operand\nimport data.odrl.action as odrl_action\nimport data.utils.helper as helper\nimport data.odrl.assignee as odrl_assignee\nimport data.ngsild.leftOperand as ngsild_lo\nimport rego.v1\nimport data.odrl.operator as odrl_operator\n\nis_allowed if {\nodrl_assignee.is_user(helper.issuer,\"admin@provider.org\")\nodrl_operand.and_sequence_operand([odrl_operator.eq_operator(ngsild_lo.entity_type(helper.http_part),\"EnergyReport\")])\nodrl_action.is_read(helper.http_part)\n}"
    },
    {
        "id": "qpnthwcvla",
        "odrl": "{\"@context\":{\"dc\":\"http://purl.org/dc/elements/1.1/\",\"dct\":\"http://purl.org/dc/terms/\",\"owl\":\"http://www.w3.org/2002/07/owl#\",\"odrl\":\"http://www.w3.org/ns/odrl/2/\",\"rdfs\":\"http://www.w3.org/2000/01/rdf-schema#\",\"skos\":\"http://www.w3.org/2004/02/skos/core#\"},\"@id\":\"https://mp-operation.org/policy/common/type\",\"@type\":\"odrl:Policy\",\"odrl:permission\":{\"odrl:assigner\":{\"@id\":\"https://www.mp-operation.org/\"},\"odrl:target\":{\"@type\":\"odrl:AssetCollection\",\"odrl:source\":\"urn:asset\",\"odrl:refinement\":[{\"@type\":\"odrl:Constraint\",\"odrl:leftOperand\":\"ngsi-ld:entityType\",\"odrl:operator\":{\"@id\":\"odrl:eq\"},\"odrl:rightOperand\":\"EnergyReport\"}]},\"odrl:assignee\":{\"@id\":\"sebastian@provider.org\"},\"odrl:action\":{\"@id\":\"odrl:read\"}}}",
        "rego": "package policy.qpnthwcvla\n\nimport data.odrl.operand as odrl_operand\nimport data.odrl.action as odrl_action\nimport data.utils.helper as helper\nimport data.odrl.assignee as odrl_assignee\nimport data.ngsild.leftOperand as ngsild_lo\nimport rego.v1\nimport data.odrl.operator as odrl_operator\n\nis_allowed if {\nodrl_operand.and_sequence_operand([odrl_operator.eq_operator(ngsild_lo.entity_type(helper.http_part),\"EnergyReport\")])\nodrl_action.is_read(helper.http_part)\nodrl_assignee.is_user(helper.issuer,\"sebastian@provider.org\")\n}"
    }
]
```

#### Measured results

Functional Suitability Quality Metric Score: 4

#### Notes

