# Demodata 1: NGSI-LD Catalogue distribution data creation (just a brief incomplete demo) - normally behind PEP
# 201 expected
# https://smart-data-models.github.io/dataModel.DCAT-AP/Distribution/examples/example-normalized.jsonld
echo ""
echo ""
echo "Demodata 1: NGSI-LD Catalogue distribution data creation:"
echo ""

curl -v POST "${scorpio_complete_url}/ngsi-ld/v1/entities" \
    -H 'Accept: application/json' \
    -H 'Link: <https://raw.githubusercontent.com/smart-data-models/dataModel.DCAT-AP/master/context.jsonld>; rel="http://www.w3.org/ns/json-ld#context"; type="application/ld+json"' \
    -H 'Content-Type: application/json' \
    -d "{
      \"id\": \"urn:ngsi-ld:Distribution:MilanFiles001\",
      \"type\": \"Distribution\",
      \"description\": {
        \"type\": \"Property\",
        \"value\": [
          \"Distribution entry with download link to download file\"
        ]
      },      
      \"downloadURL\": {
        \"type\": \"Property\",
        \"value\": [
          \"http://${data_service_name}${partner_suffix}.${usecase_domain}/download/MilanData/urn:ngsi-ld:Distribution:MilanFiles001\"
        ]
      }
    }"


# Demodata 2: NGSI-LD Catalogue distribution data creation - Demo for TMForum API purchase
# https://smart-data-models.github.io/dataModel.DCAT-AP/Distribution/examples/example-normalized.jsonld
echo ""
echo ""
echo "Demodata 2: NGSI-LD Catalogue distribution data creation - Demo for TMForum API purchase:"
echo ""

curl -v -X POST "${scorpio_complete_url}/ngsi-ld/v1/entities" \
    -H 'Accept: */*' \
    -H 'Content-Type: application/json' \
    -d "{
      \"id\": \"urn:ngsi-ld:DistributionTMForum:MilanFiles002TMForum\",
      \"type\": \"DistributionTMForum\",
      \"description\": {
        \"type\": \"Property\",
        \"value\": [
          \"Distribution entry with download link to download file AFTER PURCHASING IT VIA TM FORUM API\"
        ]
      },
      \"downloadURL\": {
        \"type\": \"Property\",
        \"value\": [
          \"http://${data_service_name}${partner_suffix}.${usecase_domain}/download/MilanData/urn:ngsi-ld:Distribution:MilanFiles002TMForum\"
        ]
      }
    }"