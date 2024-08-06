## [2.2.2.5] Data product publication: Publication - Deploy/config usage control functions
### Stack: Fiware

### Statement of assessment
#### Environment

The test is conducted in the IONOS FIWARE_cluster cluster using node pool IP 85.215.161.198.

#### Tested quality metric and method

The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). For the current phase (phase 1), the test focuses on the Functional Suitability quality metric.

#### Comparative criteria 
1. Usage control policies can support enforcement by external input
2. Usage control policies can support enforcement by manual input.

#### Expected output
- Policies can be created via external input. 
- Policies can be created via manual input 

### Results
#### Assessment
Policies can only be created via manual input. Here's an example on how to do so.

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



#### Measured results
((0*3)/3 + (2+4+4)/3 + (0*3)/3 +(2+4+4)/3)/4 = (20/3)/4  = 20/12 = 1.66

#### Notes

