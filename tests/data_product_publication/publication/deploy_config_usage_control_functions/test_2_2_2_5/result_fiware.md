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

#### Measured results


The criteria used to measure the results was the one specified by the Data Product Publication ISO25010 Quality file regarding Functional Suitability.

| **Criterion**                | **Description**                                                                                     | **Score (0-4)** | **Explanation**                                                                 |
|------------------------------|-----------------------------------------------------------------------------------------------------|-----------------|---------------------------------------------------------------------------------|
| **Functional Completeness**   | Technical requirements cover all the specified tasks and user objectives.                          | 2               | The Fiware connector only partially meets the requirements, as it supports policy creation via manual input but lacks the capability for policy creation through external input. |
| **Functional Correctness**    | Technical requirements meet results with the needed degree of precision.                           | 4               | The manual policy creation process works accurately and consistently as demonstrated by the example command. The policies created meet the expected format and enforce the required rules. |
| **Functional Appropriateness**| Technical requirements facilitate the accomplishment of specified tasks and objectives.            | 3               | While the manual input method is effective, the lack of external input support limits the platform's flexibility, making it less appropriate for diverse deployment scenarios. |

**Overall calculation:** (2 + 4 + 3)/3 = 3
Functional Suitability Quality Metric Score: 3

#### Notes
The Fiware connector shows strong capability in manual policy creation, but its functional completeness is hindered by the absence of support for external input methods. This affects its overall flexibility and appropriateness in broader usage scenarios.


