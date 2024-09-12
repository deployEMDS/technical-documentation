# THERE ARE DIFFERENT IMPLEMENTATIONS FOR base64 encoding in different OSes. 
# There are two options available for Linux and MacOS, by default MacOS is activated
# Please toggle comments in 4 cases in create_accesstoken.sh

# Obtain Data Service Token Endpoint
export TOKEN_ENDPOINT=$(curl -s -X GET "$1/.well-known/openid-configuration" | jq -r '.token_endpoint'); echo ""; echo Service Token Endpoint $TOKEN_ENDPOINT; echo ""


# Obtain Verifiable presentation
export VERIFIABLE_PRESENTATION="{
    \"@context\": [\"https://www.w3.org/2018/credentials/v1\"],
    \"type\": [\"VerifiablePresentation\"],
    \"verifiableCredential\": [
        \"${VERIFIABLE_CREDENTIAL}\"
    ],
    \"holder\": \"${HOLDER_DID}\"
  }"; echo ""; echo Verifiable presentation VP: ${VERIFIABLE_PRESENTATION}; echo ""

#Create Header for JWT Token with embedded VP
export JWT_HEADER=$(echo -n "{\"alg\":\"ES256\", \"typ\":\"JWT\", \"kid\":\"${HOLDER_DID}\"}"| base64 -w 0 | sed s/\+/-/g | sed 's/\//_/g' | sed -E s/=+$//); echo ""; echo Header: ${JWT_HEADER}; echo ""

# export JWT_HEADER=$(echo -n "{\"alg\":\"ES256\", \"typ\":\"JWT\", \"kid\":\"${HOLDER_DID}\"}"| base64 -b 0 | sed s/\+/-/g | sed 's/\//_/g' | sed -E s/=+$//); echo ""; echo Header: ${JWT_HEADER}; echo ""


# Create Payload for JWT Token with embedded VP
export PAYLOAD=$(echo -n "{\"iss\": \"${HOLDER_DID}\", \"sub\": \"${HOLDER_DID}\", \"vp\": ${VERIFIABLE_PRESENTATION}}" | base64 -w 0 | sed s/\+/-/g |sed 's/\//_/g' |  sed -E s/=+$//); echo ""; echo Payload: ${PAYLOAD}; echo ""  

# export PAYLOAD=$(echo -n "{\"iss\": \"${HOLDER_DID}\", \"sub\": \"${HOLDER_DID}\", \"vp\": ${VERIFIABLE_PRESENTATION}}" | base64 -b 0 | sed s/\+/-/g |sed 's/\//_/g' |  sed -E s/=+$//); echo ""; echo Payload: ${PAYLOAD}; echo ""  


# Create Signature for JWT Token with embedded VP
export SIGNATURE=$(echo -n "${JWT_HEADER}.${PAYLOAD}" | openssl dgst -sha256 -binary -sign private-key.pem | base64 -w 0 | sed s/\+/-/g | sed 's/\//_/g' | sed -E s/=+$//); echo ""; echo Signature: ${SIGNATURE}; echo ""

# export SIGNATURE=$(echo -n "${JWT_HEADER}.${PAYLOAD}" | openssl dgst -sha256 -binary -sign private-key.pem | base64 -b 0 | sed s/\+/-/g | sed 's/\//_/g' | sed -E s/=+$//); echo ""; echo Signature: ${SIGNATURE}; echo ""


# Create combined string for JWT Token with embedded VP
export JWT="${JWT_HEADER}.${PAYLOAD}.${SIGNATURE}"; echo ""; echo The Token: ${JWT}; echo ""


# Base64 encode combined string for JWT Token with embedded VP
export VP_TOKEN=$(echo -n ${JWT} | base64 -w 0 | sed s/\+/-/g | sed 's/\//_/g' | sed -E s/=+$//); echo ""; echo ${VP_TOKEN}; echo ""

# export VP_TOKEN=$(echo -n ${JWT} | base64 -b 0 | sed s/\+/-/g | sed 's/\//_/g' | sed -E s/=+$//); echo ""; echo VP Token: ${VP_TOKEN}; echo ""

# Tool for decoding base64 https://base64.guru/converter/decode
# Tool for displaying content of JWT https://jwt.io


# Obtain final Data Service Access Token
export SERVICE_ACCESS_TOKEN=$(curl -s -X POST $TOKEN_ENDPOINT \
      --header 'Accept: */*' \
      --header 'Content-Type: application/x-www-form-urlencoded' \
      --data grant_type=vp_token \
      --data vp_token=${VP_TOKEN} \
      --data scope=$2 | jq '.access_token' -r ); echo ""; echo Service Access Token: ${SERVICE_ACCESS_TOKEN}; echo ""
