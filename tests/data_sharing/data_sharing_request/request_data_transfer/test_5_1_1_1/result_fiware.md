## [5.1.1.1] Data sharing: Data sharing request - Request data transfer
### Stack: Fiware

### Statement of assessment
#### Environment

This functionality has been tested in the [IONOS Deployment](/deployment/fiware/README.md)

#### Tested quality metric and method

The Fiware connector is a connector that only exists on the data provider side.
It  is based on APISIX and therefore it supports a lot of different protocols for data exchange.
Therefore, the ways to initiate a data transfer, or simply said, the ways for downloading a resource, can differ.
The steps to initiate a data transfer for an HTTP resource that can be retrieved with a HTTP GET request have been tested.

These steps include:

1. Getting the token endpoint for retrieving an access token to download the data
2. Using the token endpoint to get the access token
3. Using the access token to download the data

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
Since there is no Fiware Connector on the consumer side, there will be no components on the data consumer side that support the:
- initiation of a data transfer
- logging of a data transfer
- retrrieval of data transfers logs

### Results

#### Assessment

The following steps from above have been done:
1. Getting the token endpoint for retrieving an access token to download the data
```
curl --location --request GET 'http://data-service.fiwareconnector.de/.well-known/openid-configuration'
```

2. Using the token endpoint to get the access token (the vp_token value has been removed for readability)
```
curl --location --request POST 'http://verifier.fiwareconnector.de/services/data-service/token' \
--header 'Accept: */*' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'grant_type=vp_token' \
--data-urlencode 'vp_token=...' \
--data-urlencode 'scope=default'
```

3. Using the access token to download the data (the actual bearer token value has been removed for readability)
```
curl --location --request GET 'http://data-service.fiwareconnector.de/ngsi-ld/v1/entities/urn:ngsi-ld:EnergyReport:fms-1' \
--header 'Accept: application/json' \
--header 'Authorization: Bearer ...'
```

The logs can be consulted to:
- Retrieve data sharing information and status 
- Receive data sharing request outcome condition 
- Retrieve data sharing information of past data sharing actions.

Kubernetes provides APIs to access these logs.

These logs could also be added/crawled into a system that provides an API to download or query the logs. Like e.g. Grafana Loki or a solution based on ElasticSearch. The current setup does not contain such a log store.

Nginx Logs
```
185.56.150.174 - - [14/Aug/2024:10:49:25 +0000] "GET /v4/issuers/did:key:zDnaehyDsm7rkbt3t1wqYZm7vAyaEt83EZtnSF35tpXuGNgQu HTTP/1.1" 200 83 "-" "Go-http-client/1.1" 170 0.015 [trust-anc ││ 185.56.150.174 - - [14/Aug/2024:10:49:25 +0000] "POST /services/data-service/token HTTP/1.1" 200 1259 "-" "PostmanRuntime/7.29.2" 2842 0.380 
```

VCVerifier Logs
```
{"level":"debug","msg":"\u0026{POST /services/data-service/token HTTP/1.1 1 1 map[Accept:[*/*] Accept-Encoding:[gzip, deflate, br] Content-Length:[2533] Content-Type:[application/x-www- │
│ {"level":"warning","msg":"Got token ZXlKaGJHY2lPaUpGVXpJMU5pSXNJQ0owZVhBaU9pSktWMVFpTENBaWEybGtJam9pWkdsa09tdGxlVHA2Ukc1aFpXSkZWM0EyVjJkUlJXZE5lV3RyUTFSM1NHcDZZa1YyYlZGNmRFTkRiMmxSTlZBM │
│ {"level":"debug","msg":"Found service for data-service","time":"2024-08-14T10:51:39Z"}                                                                                                    │
│ {"level":"debug","msg":"Get issuers list for data-service - default - NaturalPersonCredential.","time":"2024-08-14T10:51:39Z"}                                                            │
│ {"level":"debug","msg":"Found trusted issuers for [http://tir-ta.fiwareconnector.de] for data-service - NaturalPersonCredential","time":"2024-08-14T10:51:39Z"}                               │
│ {"level":"debug","msg":"Get participants list for data-service - default - NaturalPersonCredential.","time":"2024-08-14T10:51:39Z"}                                                       │
│ {"level":"debug","msg":"Found trusted participants [http://tir-ta.fiwareconnector.de] for data-service - NaturalPersonCredential","time":"2024-08-14T10:51:39Z"}                              │
│ {"level":"debug","msg":"Verify trusted participant for \"eyJhbGciOiJFUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJkaWQ6a2V5OnpEbmFlaHlEc203cmtidDN0MXdxWVptN3ZBeWFFdDgzRVp0blNGMzV0cFh1R05nUXUi │
│ {"level":"info","msg":"Participants are: map[NaturalPersonCredential:[http://tir-ta.fiwareconnector.de]]","time":"2024-08-14T10:51:39Z"}                                                      │
│ {"level":"info","msg":"First Value is [http://tir-ta.fiwareconnector.de]","time":"2024-08-14T10:51:39Z"}                                                                                      │
│ {"level":"debug","msg":"Check if a participant did:key:zDnaehyDsm7rkbt3t1wqYZm7vAyaEt83EZtnSF35tpXuGNgQu is trusted through http://tir-ta.fiwareconnector.de.","time":"2024-08-14T10:51:39Z"} │
│ {"level":"debug","msg":"Get issuer http://tir-ta.fiwareconnector.de/v4/issuers/did:key:zDnaehyDsm7rkbt3t1wqYZm7vAyaEt83EZtnSF35tpXuGNgQu.","time":"2024-08-14T10:51:39Z"}                     │
│ {"level":"debug","msg":"Issuer did:key:zDnaehyDsm7rkbt3t1wqYZm7vAyaEt83EZtnSF35tpXuGNgQu response from http://tir-ta.fiwareconnector.de is 200","time":"2024-08-14T10:51:39Z"}                │
│ {"level":"debug","msg":"Issuer did:key:zDnaehyDsm7rkbt3t1wqYZm7vAyaEt83EZtnSF35tpXuGNgQu is a trusted participant via http://tir-ta.fiwareconnector.de.","time":"2024-08-14T10:51:39Z"}       │
│ {"level":"debug","msg":"Validate trusted issuer for \"eyJhbGciOiJFUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJkaWQ6a2V5OnpEbmFlaHlEc203cmtidDN0MXdxWVptN3ZBeWFFdDgzRVp0blNGMzV0cFh1R05nUXUifQ. │
│ {"level":"debug","msg":"Get issuer http://tir-ta.fiwareconnector.de/v4/issuers/did:key:zDnaehyDsm7rkbt3t1wqYZm7vAyaEt83EZtnSF35tpXuGNgQu.","time":"2024-08-14T10:51:39Z"}                     │
│ {"level":"debug","msg":"Got issuer {\"did\":\"did:key:zDnaehyDsm7rkbt3t1wqYZm7vAyaEt83EZtnSF35tpXuGNgQu\",\"attributes\":[]}.","time":"2024-08-14T10:51:39Z"}                             │
│ {"level":"debug","msg":"No forbidden claim found for subject {}. Checked config was {\"validFor\":{\"from\":\"\",\"to\":\"\"},\"credentialsType\":\"\",\"claims\":null}.","time":"2024-08 │
│ {"level":"debug","msg":"Credential \"eyJhbGciOiJFUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJkaWQ6a2V5OnpEbmFlaHlEc203cmtidDN0MXdxWVptN3ZBeWFFdDgzRVp0blNGMzV0cFh1R05nUXUifQ.eyJuYmYiOjE3MjM2M │
│ {"level":"info","msg":"Generated and signed token: {Bearer 1800 eyJhbGciOiJSUzI1NiIsImtpZCI6Ik1pdWlSS1VrU3VVcTc2QzVXQTZNTTdITDN6WWl4b04zeEZSOXNTcHljenciLCJ0eXAiOiJKV1QifQ.eyJhdWQiOlsiZG │
│ {"level":"info","msg":"Request [POST]/services/data-service/token took 304788595 ms - Result: 200","time":"2024-08-14T10:51:39Z"}      
```

Logs of Open Policy Agent (in this case, access has been denied)
```
{"client_addr":"127.0.0.1:53420","level":"info","msg":"Received request.","req_body":"{\"input\":{\"var\":{\"remote_port\":\"44784\",\"timestamp\":1723633160,\"server_port\":\"9080\",\"
{"client_addr":"127.0.0.1:53420","level":"info","msg":"Sent response.","req_id":8,"req_method":"POST","req_path":"/v1/data/policy/main","resp_body":"{\"result\":{\"allow\":false}}
```

#### Measured results

Initiation of data sharing works. The logging features can only be used to a limited extend as they are currently lacking vital information like, who tried to access or why was access denied.

| Requirement | Measured KPI |
| -|-|
| Initiate a data sharing | 4 |
| Retrieve data sharing information and status | 1 |
| Receive data sharing request outcome condition | 1 |
| Retrieve data sharing information of past data sharing actions. | 1 |
| **Result**|**1.75**|

Functional Suitability Quality Metric Score: 1.75

#### Notes

