## [1.2.1.1] Participant onboarding: Evaluation - Self-assessment
### Stack: Fiware

### Statement of assessment
The test is conducted in the IONOS FIWARE_cluster cluster using node pool IP 85.215.161.198.

#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
How participant onboarding is made. 

### Results
#### Assessment
Before participating in a data space, an organization needs to be onboarded at the data space's Participant List Service by registering it as trusted participant. The user invoking the onboarding process needs to present a VC issued by the organization to the user itself, a VC containing the self description of the organization and a VC issued by a trusted Compliancy Service for the organization self description.

The commands used for this process are:
```shell
    export ACCESS_TOKEN=$(curl --insecure -v -X POST https://keycloak.demo-portal.eu/realms/test-realm/protocol/openid-connect/token  \
        --header 'Accept: */*' \
        --header 'Content-Type: application/x-www-form-urlencoded' \
        --data grant_type=password \
        --data client_id=admin-cli \
        --data username=admin-user \
        --data password=test | jq '.access_token' -r); echo ${ACCESS_TOKEN}
```


To Check credential_configuration_id from Keycloak credential issuer info endpoint:
```shell
    curl --insecure -v -X GET https://keycloak.demo-portal.eu/realms/test-realm/.well-known/openid-credential-issuer
```

To get the offer URI:
```shell
    export OFFER_URI=$(curl --insecure -s -X GET 'https://keycloak.demo-portal.eu/realms/test-realm/protocol/oid4vc/credential-offer-uri?credential_configuration_id=natural-person' \
        --header "Authorization: Bearer ${ACCESS_TOKEN}" | jq '"\(.issuer)\(.nonce)"' -r); echo ${OFFER_URI}
```

To get the Pre_authorized_code
```shell
    export PRE_AUTHORIZED_CODE=$(curl --insecure -s -X GET ${OFFER_URI} \
                --header "Authorization: Bearer ${ACCESS_TOKEN}" | jq '.grants."urn:ietf:params:oauth:grant-type:pre-authorized_code"."pre-authorized_code"' -r); echo ${PRE_AUTHORIZED_CODE}
```

To get the Credential Access Token:
```shell
    export CREDENTIAL_ACCESS_TOKEN=$(curl --insecure -s -X POST https://keycloak.demo-portal.eu/realms/test-realm/protocol/openid-connect/token \
        --header 'Accept: */*' \
        --header 'Content-Type: application/x-www-form-urlencoded' \
        --data grant_type=urn:ietf:params:oauth:grant-type:pre-authorized_code \
        --data code=${PRE_AUTHORIZED_CODE} | jq '.access_token' -r); echo ${CREDENTIAL_ACCESS_TOKEN}
```

To get the Verifiable Credential:
```shell
    export VERIFIABLE_CREDENTIAL=$(curl --insecure -s -X POST https://keycloak.demo-portal.eu/realms/test-realm/protocol/oid4vc/credential \
        --header 'Accept: */*' \
        --header 'Content-Type: application/json' \
        --header "Authorization: Bearer ${CREDENTIAL_ACCESS_TOKEN}" \
        --data '{"credential_identifier":"natural-person", "format":"jwt_vc"}' | jq '.credential' -r); echo ${VERIFIABLE_CREDENTIAL}
```

#### Measured results

The criteria used to measure the results was the one specified by the Data Product Publication ISO25010 Quality file regarding Functional Suitability.

| **Criterion**                | **Description**                                                                                     | **Score (0-4)** | **Explanation** |
|------------------------------|-----------------------------------------------------------------------------------------------------|-----------------|-----------------|
| **Functional Completeness**   | Technical requirements cover all the specified tasks and user objectives.                          | 4               | The Fiware connector fully supports the participant onboarding process, covering all necessary steps for registering an organization as a trusted participant, including issuing and validating Verifiable Credentials (VCs). This ensures a comprehensive onboarding process. |
| **Functional Correctness**    | Technical requirements meet results with the needed degree of precision.                           | 3               | While the onboarding process is generally accurate, there may be some areas where precision could be improved, particularly in handling edge cases or specific configurations. However, the core functionalities perform as expected. |
| **Functional Appropriateness**| Technical requirements facilitate the accomplishment of specified tasks and objectives.            | 3               | The process is appropriate for the task, enabling organizations to onboard effectively. However, some steps could be streamlined to enhance efficiency, such as reducing the complexity of commands or improving the integration with identity providers. |

**Overall Calculation: (4+3+3)/3 = 3.33**

Functional Suitability Quality Metric Score: 3.33

#### Notes

