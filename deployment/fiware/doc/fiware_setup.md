# Fiware Tests

## Creation of routes for APISIX gateway

Create new routes (that were preloaded in former versions)

Run route creation script

```sh
sh create_routes.sh
```

Access the graphical dashboard, 6 routes expected under tab Route

```sh
echo "${apisix_dashboard_prefix}${partner_suffix}.${usecase_domain}/routes/list"
```

User: deployemds  -  (see apisix.dashboard config in provider-values.yaml)
PW: deployemds  -  (see apisix.dashboard config in provider-values.yaml)


## Test routes and plugins

Test new routes and some of their plugins

Test /.well-known/openid-configuration data service route: 200 + JSON-Object expected

```sh
curl -v ${data_service_complete_url}/.well-known/openid-configuration
```

Test NGSI-LD route: 401 expected

```sh
curl -v "${data_service_complete_url}/ngsi-ld/v1/entities/urn:ngsi-ld:Distribution:MilanFiles001"
```

Test Milan file download route: 401 expected

```sh
curl --output gtfs.zip -0 -v "${data_service_complete_url}/download/MilanData/urn:ngsi-ld:Distribution:MilanFiles001"
```

Test APISIX MyTest demo route with playing with changing proximirror and httplogger from on to off 

WATCH OUT FOR only 3 requests in 30 sec

Pipdream page under https://public.requestbin.com/r/envjjxkl6429c/1eRiK3LNQmOGPecSeYbh1mRKHxQ

Check pipedream requestbin and Delete all at the bottom left corner button

Test 2x on: 200 expected, 3 entries on pipedream

```sh
curl -v "${data_service_complete_url}/test/mytest.html?proxymirror=on&httplogger=on"
```

Check pipedream requestbin and Delete all at the bottom left corner button

Test proxymirror off: 200 expected, 2 entries on pipedream after some seconds

```sh
curl -v "${data_service_complete_url}/test/mytest.html?proxymirror=off&httplogger=on"
```

Check pipedream requestbin and Delete all at the bottom left corner button

Test httplogger off: 200 expected, 2 entries on pipedream

```sh
curl -v "${data_service_complete_url}/test/mytest.html?proxymirror=on&httplogger=off"
```

Check pipedream requestbin and Delete all at the bottom left corner button

Test 2xoff: 200 expected, 1 entries on pipedream

```sh
curl -v "${data_service_complete_url}/test/mytest.html?proxymirror=off&httplogger=off"
```

Check pipedream requestbin and Delete all at the bottom left corner button

Test limit count 3x in 30sec: 200, 200, 200, 503 expected, check X-RateLimit header in Response

```sh
curl -v "${data_service_complete_url}/test/mytest.html?proxymirror=off&httplogger=off"
```

Check pipedream requestbin and Delete all at the bottom left corner button for others to start blank, too

Test /.well-known/openid-configuration tmf api route: 200 + JSON-Object expected

```sh
curl -v "${tmf_api_complete_url}/.well-known/openid-configuration"
```

Test tmf-api route: 401 expected

```sh
curl -v "${tmf_api_complete_url}/tmf-api/productCatalogManagement/v4/productSpecification"
```

Test filtering route search by labels attached to routes above: result total:1 expected

```sh
curl -v "${apisix_control_api_complete_url}/routes?label=negotiation-status-agreed" \
    --header "X-API-KEY: $admin_api_key"
```

## Create policies

Create policies, always 200 and a print of the rego policies expected

Run policy creation script

```sh
sh create_policies.sh
```

## Create demo data

Run demodata creation script

```sh
sh create_demodata.sh
```

## Prepare keycloak credential configuration

#### CREATE NEW HOLDER_DID

Must only be run 1 time in a terminal session

```sh
docker run -v $(pwd):/cert quay.io/wi_stefan/did-helper:0.1.1
cat did.json
export HOLDER_DID=$(cat did.json | jq '.id' -r); echo ${HOLDER_DID}
```

Check credential_configuration_id from Keycloak credential issuer info endpoint

```sh
curl --insecure -v "${keycloak_complete_url}/realms/test-realm/.well-known/openid-credential-issuer"
```

### Create Keycloak VCs and NGSI-LD data service access token

Create Data Service Access Token for NGSI_LD Data + MilanData File download

Run vc creation script

```sh
source create_vc.sh user-credential
```

### Run access token creation script

IMPORTANT: THERE ARE DIFFERENT IMPLEMENTATIONS FOR base64 encoding in different OSes. 

There are two options available for Linux and MacOS, by default MacOS is activated

Please toggle comments in 4 cases in create_accesstoken.sh

```sh
source create_accesstoken.sh ${data_service_complete_url} default
```

## Access NGSI-LD Data

Access NGSI-LD Data, Route 2, Policy 1, Demodata 1

Direct data retrieval via direct route without security, 200 expected

```sh
curl -v "${scorpio_complete_url}/ngsi-ld/v1/entities/urn:ngsi-ld:Distribution:MilanFiles001" \
    -H 'Link: <https://raw.githubusercontent.com/smart-data-models/dataModel.DCAT-AP/master/context.jsonld>; rel="http://www.w3.org/ns/json-ld#context"; type="application/ld+json"'
```

Data retrieval via secured route, no service access token, 401 expected

```sh
curl -v "${data_service_complete_url}/ngsi-ld/v1/entities/urn:ngsi-ld:Distribution:MilanFiles001" \
    -H 'Link: <https://raw.githubusercontent.com/smart-data-models/dataModel.DCAT-AP/master/context.jsonld>; rel="http://www.w3.org/ns/json-ld#context"; type="application/ld+json"'
```

Data retrieval via secured route, providing the service access token, 200 expected

```sh
curl -v "${data_service_complete_url}/ngsi-ld/v1/entities/urn:ngsi-ld:Distribution:MilanFiles001" \
    -H "Accept: application/json" \
    -H "Authorization: Bearer ${SERVICE_ACCESS_TOKEN}" \
    -H 'Link: <https://raw.githubusercontent.com/smart-data-models/dataModel.DCAT-AP/master/context.jsonld>; rel="http://www.w3.org/ns/json-ld#context"; type="application/ld+json"'
```

## Access MilanData File download

Access MilanData File download, Route 3, Policy 1, Demodata from Milano

Direct data retrieval via direct route without security, 200 expected

```sh
curl --output gtfs.zip -0 -v "https://dati.comune.milano.it/gtfs.zip"
```

Data retrieval via secured route, no service access token, 401 expected

```sh
curl --output gtfs.zip -0 -v "${data_service_complete_url}/download/MilanData/urn:ngsi-ld:Distribution:MilanFiles001"
```

Data retrieval via secured route, providing the service access token, 200 expected

```sh
curl --output gtfs.zip -0 -v "${data_service_complete_url}/download/MilanData/urn:ngsi-ld:Distribution:MilanFiles001" \
    -H "Authorization: Bearer ${SERVICE_ACCESS_TOKEN}"
```


## Prepare access at TM Forum API

Prepare access at TM Forum API and Data, Route 6, Policy 5, Demodata 2

Buy access and and read TMForum Distribution data

Try access data service with user-credential, 401 expected, as operator-credential needed

Run vc creation script

```sh
source create_vc.sh user-credential
```

Run access token creation script

IMPORTANT: THERE ARE DIFFERENT IMPLEMENTATIONS FOR base64 encoding in different OSes. 

There are two options available for Linux and MacOS, by default MacOS is activated

Please toggle comments in 4 cases in create_accesstoken.sh

```sh
source create_accesstoken.sh ${data_service_complete_url} default
```

Sometimes you have to repeat

Try access ngsi-ld data service with user-credential, 403 expected, as operator-credential needed

```sh
curl -v "${data_service_complete_url}/ngsi-ld/v1/urn:ngsi-ld:DistributionTMForum:MilanFiles002TMForum" \
    -H "Accept: application/json" \
    -H "Authorization: Bearer ${SERVICE_ACCESS_TOKEN}" \
    -H 'Link: <https://raw.githubusercontent.com/smart-data-models/dataModel.DCAT-AP/master/context.jsonld>; rel="http://www.w3.org/ns/json-ld#context"; type="application/ld+json"'
```

Try access data service with operator-credential, 401 expected, as operator-credential not existent

Run vc creation script

```sh
source create_vc.sh operator-credential
```

Run access token creation script, null Service Access Token returned, because the CUSTOMER_DID is not registered to use operator credentials, 

IMPORTANT: THERE ARE DIFFERENT IMPLEMENTATIONS FOR base64 encoding in different OSes. 

There are two options available for Linux and MacOS, by default MacOS is activated

Please toggle comments in 4 cases in create_accesstoken.sh

```sh
source create_accesstoken.sh ${data_service_complete_url} operator
```

Export the Fancy Marketplace's did

Correct error in did-helper ingress annotations, otherwise no access from outside

Download wrong ingress file

```sh
kubectl get ingress did-helper -n consumer -o yaml > did-helper-ingress.yaml
```

Open downloaded file with text editor
```sh
nano did-helper-ingress.yaml
```

Change spec.rules.http.paths.backend.service.port.name and save the file after add annotation:

kubernetes.io/ingress.class: nginx

Reupload changed ingress file

```sh
kubectl replace -f did-helper-ingress.yaml
```

Expected result in terminal:

ingress.networking.k8s.io/mydsc-apisix-control-plane replaced

Extract the CONSUMER_DID

```sh
export CONSUMER_DID=$(curl -X GET "${did_helper_consumer_complete_url}/did-material/did.env" | cut -d'=' -f2); echo ${CONSUMER_DID} 
```

NO CONSUMER DID REGISTERED IN PROVIDER LIST - Verfifier does not allow Operator Token generation, nur 1 Eintrag

```sh
curl http://tir-provider.demo-portal.eu/v4/issuers/$CONSUMER_DID
```

https://base64.guru/converter/decode
https://github.com/FIWARE/trusted-issuers-list?tab=readme-ov-file#usage


Register User at Fancy Marketplace at M&P Operations

Run vc creation script

```sh
source create_vc.sh user-credential
```

Run access token creation script, no Service Access Token returned

IMPORTANT: THERE ARE DIFFERENT IMPLEMENTATIONS FOR base64 encoding in different OSes. 

There are two options available for Linux and MacOS, by default MacOS is activated

Please toggle comments in 4 cases in create_accesstoken.sh

```sh
source create_accesstoken.sh ${data_service_complete_url} default
```

Register User at Fancy Marketplace at M&P Operations

```sh
export FANCY_MARKETPLACE_ID=$(curl -v -X POST "${tmf_api_complete_url}/tmf-api/party/v4/organization" \
    -H 'Accept: */*' \
    -H 'Content-Type: application/json' \
    -H "Authorization: Bearer ${SERVICE_ACCESS_TOKEN}" \
    -d "{
      \"name\": \"Fancy Marketplace Inc.\",
      \"partyCharacteristic\": [
        {
          \"name\": \"did\",
          \"value\": \"${CONSUMER_DID}\" 
        }
      ]
    }" | jq '.id' -r); echo ${FANCY_MARKETPLACE_ID}
```

Create the TM Forum product specification

```sh
export PRODUCT_SPEC_ID=$(curl -v -X POST "${tmf_api_direct_complete_url}/tmf-api/productCatalogManagement/v4/productSpecification" \
     -H 'Content-Type: application/json;charset=utf-8' \
     -d '{
        "brand": "M&P Operations",
        "version": "1.0.0",
        "lifecycleStatus": "ACTIVE",
        "name": "M&P K8S"
     }' | jq '.id' -r ); echo ""; echo Product Spec ID: ${PRODUCT_SPEC_ID}; echo ""
```

Create the product offering, referencing the product specification

```sh
export PRODUCT_OFFERING_ID=$(curl -X POST "${tmf_api_direct_complete_url}/tmf-api/productCatalogManagement/v4/productOffering" \
     -H 'Content-Type: application/json;charset=utf-8' \
     -d "{
        \"version\": \"1.0.0\",
        \"lifecycleStatus\": \"ACTIVE\",
        \"name\": \"M&P K8S Offering\",
        \"productSpecification\": {
          \"id\": \"${PRODUCT_SPEC_ID}\"
        }
     }"| jq '.id' -r ); echo ""; echo Product Offering ID:  ${PRODUCT_OFFERING_ID}; echo ""
```

Buy access. In order to buy access, a ProductOrder, referencing the offering from M&P Operations has to be created.

Run vc creation script

```sh
source create_vc.sh user-credential
```

Run access token creation script

IMPORTANT: THERE ARE DIFFERENT IMPLEMENTATIONS FOR base64 encoding in different OSes. 

There are two options available for Linux and MacOS, by default MacOS is activated

Please toggle comments in 4 cases in create_accesstoken.sh

```sh
source create_accesstoken.sh ${data_service_complete_url} default
```

List TM Forum offerings

```sh
curl -v -X GET "${tmf_api_complete_url}/tmf-api/productCatalogManagement/v4/productOffering" \
    -H "Authorization: Bearer ${SERVICE_ACCESS_TOKEN}"
```

Choose one of the TM Forum offerings, in the demo, there is only 1

```sh
export OFFER_ID=$(curl -v -X GET "${tmf_api_complete_url}/tmf-api/productCatalogManagement/v4/productOffering" \
    -H "Authorization: Bearer ${SERVICE_ACCESS_TOKEN}" | jq '.[0].id' -r); echo ${OFFER_ID}
```

Create the TM Forum order to buy/get access to NGSI-LD:

```sh
curl -v -X POST "${tmf_api_complete_url}/tmf-api/productOrderingManagement/v4/productOrder" \
   -H 'Accept: */*' \
   -H 'Content-Type: application/json' \
   -H "Authorization: Bearer ${SERVICE_ACCESS_TOKEN}" \
   -d "{
       \"productOrderItem\": [
         {
           \"id\": \"random-order-id\",
           \"action\": \"add\",
           \"productOffering\": {
             \"id\" :  \"${OFFER_ID}\"
           }
         }  
       ],
       \"relatedParty\": [
         {
           \"id\": \"${FANCY_MARKETPLACE_ID}\"
         }
       ]}"
```

Access at TM Forum API and Data, Route 6, Policy 5, Demodata 2

Read data at Fancy Marketplace with operator credential

CONSUMER DID REGISTERED IN PRPVODER LIST - Verfifier does now allow Operator Token generation, 2 Einträge

```sh
curl http://tir-provider.demo-portal.eu/v4/issuers/$CONSUMER_DID
```

https://base64.guru/converter/decode


Try with user credential, 401 expected as this entityType is only for Operators

Run vc creation script

```sh
source create_vc.sh user-credential
```

Run access token creation script

IMPORTANT: THERE ARE DIFFERENT IMPLEMENTATIONS FOR base64 encoding in different OSes. 

There are two options available for Linux and MacOS, by default MacOS is activated

Please toggle comments in 4 cases in create_accesstoken.sh

```sh
source create_accesstoken.sh ${data_service_complete_url} default
```

Read TM Forum Distribution data, 403 expected as this entityType is only for Operators

```sh
curl -v "${data_service_complete_url}/ngsi-ld/v1/entities/urn:ngsi-ld:DistributionTMForum:MilanFiles002TMForum" \
    -H "Accept: application/json" \
    -H "Authorization: Bearer ${SERVICE_ACCESS_TOKEN}" \
    -H 'Link: <https://raw.githubusercontent.com/smart-data-models/dataModel.DCAT-AP/master/context.jsonld>; rel="http://www.w3.org/ns/json-ld#context"; type="application/ld+json"'
```

Try with operator credential, 200 expected due to correct VC type and correct policy

Run vc creation script

```sh
source create_vc.sh operator-credential
```

Run access token creation script

IMPORTANT: THERE ARE DIFFERENT IMPLEMENTATIONS FOR base64 encoding in different OSes. 

There are two options available for Linux and MacOS, by default MacOS is activated

Please toggle comments in 4 cases in create_accesstoken.sh

```sh
source create_accesstoken.sh ${data_service_complete_url} operator
```

Read TM Forum Distribution data, 200 expected:

```sh
curl -v "${data_service_complete_url}/ngsi-ld/v1/entities/urn:ngsi-ld:DistributionTMForum:MilanFiles002TMForum" \
    -H "Accept: application/json" \
    -H "Authorization: Bearer ${SERVICE_ACCESS_TOKEN}" \
    -H 'Link: <https://raw.githubusercontent.com/smart-data-models/dataModel.DCAT-AP/master/context.jsonld>; rel="http://www.w3.org/ns/json-ld#context"; type="application/ld+json"'
 ```