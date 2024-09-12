# Obtain Keycloak Token endpoint
export KEYCLOAK_TOKEN_ENDPOINT=$(curl --insecure -v "${keycloak_complete_url}/realms/test-realm/.well-known/openid-configuration" | jq -r '.token_endpoint'); echo ""; echo Token endpoint: ${KEYCLOAK_TOKEN_ENDPOINT}; echo ""

# Create Keycloak Access token
export ACCESS_TOKEN=$(curl --insecure -v -X POST "${KEYCLOAK_TOKEN_ENDPOINT}"  \
      --header 'Accept: */*' \
      --header 'Content-Type: application/x-www-form-urlencoded' \
      --data grant_type=password \
      --data client_id=admin-cli \
      --data username=test-user \
      --data password=test | jq '.access_token' -r); echo ""; echo Keycloak Access Token: ${ACCESS_TOKEN}; echo "" 

# Obtain offer uri
export OFFER_URI=$(curl --insecure -s "${keycloak_complete_url}/realms/test-realm/protocol/oid4vc/credential-offer-uri?credential_configuration_id=user-credential" \
      --header "Authorization: Bearer ${ACCESS_TOKEN}" | jq '"\(.issuer)\(.nonce)"' -r); echo ""; echo Offer uri: ${OFFER_URI}; echo ""


# Obtain Pre_authorized_code
export PRE_AUTHORIZED_CODE=$(curl --insecure -s ${OFFER_URI} \
            --header "Authorization: Bearer ${ACCESS_TOKEN}" | jq '.grants."urn:ietf:params:oauth:grant-type:pre-authorized_code"."pre-authorized_code"' -r); echo ""; echo Pre Autorizated Code: ${PRE_AUTHORIZED_CODE}; echo ""


# Obtain Credential_access_token
export CREDENTIAL_ACCESS_TOKEN=$(curl --insecure -s -X POST "${keycloak_complete_url}/realms/test-realm/protocol/openid-connect/token" \
      --header 'Accept: */*' \
      --header 'Content-Type: application/x-www-form-urlencoded' \
      --data grant_type=urn:ietf:params:oauth:grant-type:pre-authorized_code \
      --data code=${PRE_AUTHORIZED_CODE} | jq '.access_token' -r); echo ""; echo Credential Access Token: ${CREDENTIAL_ACCESS_TOKEN}; echo ""

      
# Obtain defined Verifiable Credential, specified by credential identifier
export VERIFIABLE_CREDENTIAL=$(curl --insecure -s -X POST "${keycloak_complete_url}/realms/test-realm/protocol/oid4vc/credential" \
      --header 'Accept: */*' \
      --header 'Content-Type: application/json' \
      --header "Authorization: Bearer ${CREDENTIAL_ACCESS_TOKEN}" \
      --data "{\"credential_identifier\":\"$1\", \"format\":\"jwt_vc\"}" | jq '.credential' -r); echo ""; echo Verifiable Credential,  $1, JWT_VC: ${VERIFIABLE_CREDENTIAL}; echo ""
