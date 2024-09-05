# Policy 1: Create policy for NGSI-LD catalogue entry distribution resource
echo ""
echo ""
echo "Policy 1: Create policy for NGSI-LD catalogue entry distribution resource:"
echo ""

curl -v "${odrl_pap_complete_url}/policy" \
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
            "@id": "https://deployEMDS-operation.org/policy/common/type",
            "@type": "odrl:Policy",
            "odrl:permission": {
              "odrl:assigner": {
                "@id": "https://www.deployEMDS-operation.org/"
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
                    "odrl:rightOperand": "Distribution"
                  }
                ]
              },
              "odrl:assignee": {
                "@id": "vc:any"
              },
              "odrl:action": {
                "@id": "odrl:read"
              }
            }
          }'

# Policy 2: Create policy to allow every authenticated participant to read offerings
echo ""
echo ""
echo "Policy 2: Create policy to allow every authenticated participant to read offerings:"
echo ""

curl -v "${odrl_pap_complete_url}/policy" \
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
                  "odrl:leftOperand": "tmf:resource",
                  "odrl:operator": {
                    "@id": "odrl:eq"
                  },
                  "odrl:rightOperand": "productOffering"
                }
              ]
            },
            "odrl:assignee": {
              "@id": "vc:any"
            },
            "odrl:action": {
              "@id": "odrl:read"
            }
          }
        }'


# Policy 3: Create policy to allow every authenticated participant to register as customer at M&P Operations
echo ""
echo ""
echo "Policy 3: Create policy to allow every authenticated participant to register as customer at M&P Operations:"
echo ""

curl -v "${odrl_pap_complete_url}/policy" \
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
                  "odrl:leftOperand": "tmf:resource",
                  "odrl:operator": {
                    "@id": "odrl:eq"
                  },
                  "odrl:rightOperand": "organization"
                }
              ]
            },
            "odrl:assignee": {
              "@id": "vc:any"
            },
            "odrl:action": {
              "@id": "tmf:create"
            }
          }
        }'

# Policy 4: Create policy to allow every authenticated participant to create product orders:
echo ""
echo ""
echo "Policy 4: Create policy to allow every authenticated participant to create product orders:"
echo ""

curl -v "${odrl_pap_complete_url}/policy" \
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
                  "odrl:leftOperand": "tmf:resource",
                  "odrl:operator": {
                    "@id": "odrl:eq"
                  },
                  "odrl:rightOperand": "productOrder"
                }
              ]
            },
            "odrl:assignee": {
              "@id": "vc:any"
            },
            "odrl:action": {
              "@id": "tmf:create"
            }
          }
        }' 


# Policy 5: Create policy to allow use of entities of type "DistributionTMForum" to authenticated participants with the role "OPERATOR
echo ""
echo ""
echo "Policy 5: Create policy to allow creation of entities of type \"K8SCluster\" to authenticated participants with the role \"OPERATOR:\""
echo ""

curl -v "${odrl_pap_complete_url}/policy" \
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
                      "odrl:rightOperand": "DistributionTMForum"
                    }
                  ]
                },
                "odrl:assignee": {
                  "@type": "odrl:PartyCollection",
                  "odrl:source": "urn:user",
                  "odrl:refinement": {
                    "@type": "odrl:LogicalConstraint",
                    "odrl:and": [
                      {
                        "@type": "odrl:Constraint",
                        "odrl:leftOperand": {
                          "@id": "vc:role"
                        },
                        "odrl:operator": {
                          "@id": "odrl:hasPart"
                        },
                        "odrl:rightOperand": {
                          "@value": "OPERATOR",
                          "@type": "xsd:string"
                        }
                      },
                      {
                        "@type": "odrl:Constraint",
                        "odrl:leftOperand": {
                          "@id": "vc:type"
                        },
                        "odrl:operator": {
                          "@id": "odrl:hasPart"
                        },
                        "odrl:rightOperand": {
                          "@value": "OperatorCredential",
                          "@type": "xsd:string"
                        }
                      }
                    ]
                  }
                },
                "odrl:action": {
                  "@id": "odrl:use"
                }
              }
            }'  