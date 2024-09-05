# Route 1: Create data service /.well-known/openid-configuration route
echo ""
echo ""
echo "Route 1: Create data service /.well-known/openid-configuration route:"

curl "${apisix_control_api_complete_url}/routes" -H "X-API-KEY: $admin_api_key" -X PUT -d '
{
  "id": "OpenIDConfigurationDSRouteID",
  "name": "OpenIDConfigurationDSRouteName",
  "host": "'${data_service_name}${partner_suffix}.${usecase_domain}'",
  "uri": "/.well-known/openid-configuration",
  "plugins": {
    "proxy-rewrite": {
      "uri": "/services/data-service/.well-known/openid-configuration"
    }
  },
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "verifier:3000": 1
    }
  }
}'



# Route 2: Create NGSI-LD route
echo ""
echo ""
echo "Route 2: Create NGSI-LD route:"

curl "${apisix_control_api_complete_url}/routes" -H "X-API-KEY: $admin_api_key" -X PUT -d '
{
  "id": "NGSI-LDRouteID",
  "name": "NGSI-LDRouteName",
  "host": "'${data_service_name}${partner_suffix}.${usecase_domain}'",
  "uri": "/ngsi-ld/*",
  "plugins": {
    "openid-connect": {
      "bearer_only": true,
      "use_jwks": true,
      "client_id": "data-service",
      "client_secret": "unused",
      "ssl_verify": false,
      "discovery": "http://verifier:3000/services/data-service/.well-known/openid-configuration"
    },
    "opa": {
      "host": "http://localhost:8181",
      "policy": "policy/main"
    }
  },
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "data-service-scorpio:9090": 1
    }
  }
}'



# Route 3: Create Milan file download route
echo ""
echo ""
echo "Route 3: Create Milan file download route:"

curl "${apisix_control_api_complete_url}/routes" -H "X-API-KEY: $admin_api_key" -X PUT -d '
{
  "id": "MilanFileDownloadRouteID",
  "name": "MilanFileDownloadRouteName",
  "host": "'${data_service_name}${partner_suffix}.${usecase_domain}'",
  "uri": "/download/MilanData/urn:ngsi-ld:Distribution:MilanFiles001",
  "plugins": {
    "proxy-rewrite": {
      "uri": "/gtfs.zip"
    },
    "openid-connect": {
      "bearer_only": true,
      "use_jwks": true,
      "client_id": "data-service",
      "client_secret": "unused",
      "ssl_verify": false,
      "discovery": "http://verifier:3000/services/data-service/.well-known/openid-configuration"
    },
    "opa": {
      "host": "http://localhost:8181",
      "policy": "policy/main"
    }
  },
  "upstream": {
    "type": "roundrobin",
    "scheme": "https",
    "pass_host": "node",
    "nodes": {
      "dati.comune.milano.it": 1
    }
  }
}'



# Route 4: Create APISIX feature demo route
echo ""
echo ""
echo "Route 4: Create APISIX feature demo route:"

curl "${apisix_control_api_complete_url}/routes" -H "X-API-KEY: $admin_api_key" -X PUT -d '
{
  "id": "MyTestRouteID",
  "name": "MyTestRouteName",
  "desc": "MyTestRouteDesc",
  "host": "'${data_service_name}${partner_suffix}.${usecase_domain}'",
  "uri": "/test/mytest.html*",
  "methods": ["GET"],
  "status": 1,
  "plugins": {
    "proxy-rewrite": {
      "uri": "/test/yourtest.html",
      "host": "envjjxkl6429c.x.pipedream.net",
      "headers": {
        "set": {
          "X-Api-Engine": "apisix"
        },
        "add": {
          "X-Request-ID": "112233"
        },
        "remove":[
          "X-test"
        ]
      }
    },
    "limit-count": {
      "_meta": {
        "disable": false
      },
      "count": 3,
      "time_window": 30,
      "rejected_code": 503,
      "rejected_msg": "deployEMDS: Too much too fast ",
      "key": "remote_addr",
      "group": "groupOfRoutesForCounting"
    },
    "proxy-mirror": {
      "_meta": {
        "filter": [["arg_proxymirror", "==", "on"]]
      },
      "host": "https://envjjxkl6429c.x.pipedream.net:443",
      "path": "/mirror",
      "path_concat_mode": "prefix",
      "sample_ratio": 1
    },
    "http-logger": {
      "_meta": {
        "filter": [["arg_httplogger", "==", "on"]]
      },
      "uri": "https://envjjxkl6429c.x.pipedream.net:443/http-logger"
    }
  },
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "envjjxkl6429c.x.pipedream.net": 1
    }
  },
  "labels":  {"negotiation-status-agreed":"yes","API_VERSION":"v4","env":"production"}
}'



# Route 5: Create tmf-api /.well-known/openid-configuration route
echo ""
echo ""
echo "Route 5: Create tmf-api /.well-known/openid-configuration route:"

curl "${apisix_control_api_complete_url}/routes" -H "X-API-KEY: $admin_api_key" -X PUT -d '
{
  "id": "OpenIDConfigurationTMFRouteID",
  "name": "OpenIDConfigurationTMFRouteName",
  "host": "'${tmf_api_name}${partner_suffix}.${usecase_domain}'",
  "uri": "/.well-known/openid-configuration",
  "plugins": {
    "proxy-rewrite": {
      "uri": "/services/tmf-api/.well-known/openid-configuration"
    }
  },
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "verifier:3000": 1
    }
  }
}'



# Route 6: Create tmf-api route
echo ""
echo ""
echo "Route 6: Create tmf-api route"

curl "${apisix_control_api_complete_url}/routes" -H "X-API-KEY: $admin_api_key" -X PUT -d '
{
  "id": "TMF-APIRouteID",
  "name": "TMF-APIRouteName",
  "host": "'${tmf_api_name}${partner_suffix}.${usecase_domain}'",
  "uri": "/tmf-api/*",
  "plugins": {
    "openid-connect": {
      "bearer_only": true,
      "use_jwks": true,
      "client_id": "tmf-api",
      "client_secret": "unused",
      "ssl_verify": false,
      "discovery": "http://verifier:3000/services/tmf-api/.well-known/openid-configuration"
    },
    "opa": {
      "host": "http://localhost:8181",
      "policy": "policy/main"
    }
  },
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "tm-forum-api:8080": 1
    }
  }
}'