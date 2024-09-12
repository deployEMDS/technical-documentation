# create site specific values
source fw_env.sh
cat values_consumer.yaml | envsubst '$partner_suffix' > values_consumer-site.yaml
cat values_provider.yaml | envsubst '$partner_suffix' > values_provider-site.yaml
cat values_trustanchor.yaml | envsubst '$partner_suffix' > values_trustanchor-site.yaml

# Install trust anchor
helm install mytrustanchor dsc/trust-anchor -n trust-anchor --create-namespace -f values_trustanchor-site.yaml

echo "-- wait ca. 2mins"

sleep 120

echo ""
echo "-- all resources trust-anchor spinning up"
echo ""

kubectl get all -n trust-anchor
kubectl get pvc -n trust-anchor

echo ""
echo "-- mytrustanchor2 installing done"
echo ""

sleep 5



# Install consumer
helm install myconsumer dsc/data-space-connector -n consumer --create-namespace -f values_consumer-site.yaml

# Install provider
helm install myprovider dsc/data-space-connector -n provider --create-namespace -f values_provider-site.yaml

echo "-- wait ca. 10mins, due to several cascading containers starting and updating"

sleep 600

echo ""
echo "-- all resources ns consumer"
echo ""

kubectl get all -n consumer
kubectl get pvc -n consumer

echo ""
echo "-- all resources ns provider"
echo ""

kubectl get all -n provider
kubectl get pvc -n provider


echo ""
echo "-- myconsumer and myprovider installing done"
echo ""



sleep 5



echo ""
echo "-- dsc issuance-secret"
echo ""

kubectl get secret issuance-secret -n dsc -o jsonpath="{.data}"


echo ""
echo "-- tir posting issuer, 201 expected"
echo ""

curl -v POST "${til_ta_url_prefix}${partner_suffix}.${usecase_domain}/issuer" \
    --header 'Content-Type: application/json' \
    --data '{
      "did": "did:key:***REMOVED***",
      "credentials": []
    }'


echo ""
echo "-- tir issuers, 200 expected"
echo ""

curl -v "${tir_ta_url_prefix}${partner_suffix}.${usecase_domain}/v4/issuers"


echo ""
echo "-- check apisix control api available, 404 expected"
echo ""

curl -v "${data_service_scheme}${data_service_name}${partner_suffix}.${usecase_domain}/ngsi-ld/v1/entities/urn:ngsi-ld:Distribution:MilanFiles001"


echo ""
echo "-- all resources"
echo ""

kubectl get all --all-namespaces


echo ""
echo "-- all ingresses"
echo ""

kubectl get ingress --all-namespaces


echo ""
echo "-- Installation totally finished"
echo ""