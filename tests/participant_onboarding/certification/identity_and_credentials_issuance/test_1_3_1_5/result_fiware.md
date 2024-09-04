## [1.3.1.5] Participant onboarding: Certification - Identity and credentials issuance
### Stack: Fiware

### Statement of assessment
#### Environment
The test is conducted in the IONOS FIWARE_cluster cluster using node pool IP 85.215.161.198. 

#### Tested quality metric and method
The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). For the current phase (phase 1), the test focuses on the Functional Suitability quality metric.

#### Expected output
**The expected output of the test is an assessment of whether the FIWARE connector supports the full credential lifecycle, including request, issuance, validation, renewal, and revocation.**

### Results
#### Assessment

**Verifiable Credential Issuance**
1) The access token is created accessing keycloak test realm portal using the following command:
```
export ACCESS_TOKEN=$(curl --insecure -v -X POST https://keycloak.demo-portal.eu/realms/test-realm/protocol/openid-connect/token  \
      --header 'Accept: */*' \
      --header 'Content-Type: application/x-www-form-urlencoded' \
      --data grant_type=password \
      --data client_id=admin-cli \
      --data username=admin-user \
      --data password=test | jq '.access_token' -r); echo ${ACCESS_TOKEN}
```

2) Check credential_configuration_id from Keycloak credential issuer info endpoint
```
curl --insecure -v -X GET https://keycloak.demo-portal.eu/realms/test-realm/.well-known/openid-credential-issuer
```

3) Get offer uri
```
export OFFER_URI=$(curl --insecure -s -X GET 'https://keycloak.demo-portal.eu/realms/test-realm/protocol/oid4vc/credential-offer-uri?credential_configuration_id=natural-person' \
      --header "Authorization: Bearer ${ACCESS_TOKEN}" | jq '"\(.issuer)\(.nonce)"' -r); echo ${OFFER_URI}
```

4) Get Pre_authorized_code
```
export PRE_AUTHORIZED_CODE=$(curl --insecure -s -X GET ${OFFER_URI} \
            --header "Authorization: Bearer ${ACCESS_TOKEN}" | jq '.grants."urn:ietf:params:oauth:grant-type:pre-authorized_code"."pre-authorized_code"' -r); echo ${PRE_AUTHORIZED_CODE}
```

5) Get Credential_access_token
```
export CREDENTIAL_ACCESS_TOKEN=$(curl --insecure -s -X POST https://keycloak.demo-portal.eu/realms/test-realm/protocol/openid-connect/token \
      --header 'Accept: */*' \
      --header 'Content-Type: application/x-www-form-urlencoded' \
      --data grant_type=urn:ietf:params:oauth:grant-type:pre-authorized_code \
      --data code=${PRE_AUTHORIZED_CODE} | jq '.access_token' -r); echo ${CREDENTIAL_ACCESS_TOKEN}
```

**Request Verifiable Credential**
6) Get Verifiable Credential
```
export VERIFIABLE_CREDENTIAL=$(curl --insecure -s -X POST https://keycloak.demo-portal.eu/realms/test-realm/protocol/oid4vc/credential \
      --header 'Accept: */*' \
      --header 'Content-Type: application/json' \
      --header "Authorization: Bearer ${CREDENTIAL_ACCESS_TOKEN}" \
      --data '{"credential_identifier":"natural-person", "format":"jwt_vc"}' | jq '.credential' -r); echo ${VERIFIABLE_CREDENTIAL}
```

**Verify Credentials**

Credential verification is done using the Verifiert component. For more information consult: https://github.com/FIWARE/VCVerifier?tab=readme-ov-file#overview


**Revoke Credentials**
User revocation is not available. 
However, since the vcverifier does check the existence of a participant in the TIR. Participants could be deleted from the TIR and then the access would be revoked. 


#### Measured results
The VC lifecycle is partially covered by the FIWARE connector as follows:

| **VC Lifecycle Stage**          | **Coverage**                                  | **Score (0-4)** |
|---------------------------------|-----------------------------------------------|-----------------|
| **Issuance and Storage**         | Covered                                      | 4               |
| **Presentation**                 | Covered                                      | 4               |
| **Verification & Use**           | Covered                                      | 4               |
| **Revocation/Expiration**        | Not fully covered. API does not support it, but participants can be deleted to stop access. | 2               |
| **Renewal/Re-Issuance**          | Not covered, but participants can be created and deleted. | 1               |

**Overall Calculation: (4+4+4+2+1)/5 = 3**

Functional Suitability Quality Metric Score: 3






