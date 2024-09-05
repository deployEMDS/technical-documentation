source fw_env.sh

echo ""
echo "-- Installation will take around 15mins, be patient"
echo ""

echo ""
echo "-- Deleting old installations incl. old pvcs to prevent confusion with old secrets and data"
echo ""


# Un-Install previous ta stuff, especially the pvc to prevent confusing situation with old data
helm uninstall mytrustanchor -n trust-anchor
kubectl delete pvc data-trust-anchor-mysql-0 -n trust-anchor

sleep 20

kubectl get all -n trust-anchor
kubectl get pvc -n trust-anchor

echo ""
echo "-- if 2x no resources found, ta deleting done"
echo ""

sleep 5



# Un-Install previous stuff, especially the pvc to prevent confusing situation with old data
helm uninstall mydsc -n dsc                 
helm uninstall myconsumer -n consumer
helm uninstall myprovider -n provider
kubectl delete pvc data-authentication-mysql-0 -n dsc       
kubectl delete pvc data-data-service-postgis-0 -n dsc
kubectl delete pvc data-postgresql-0 -n dsc

echo "-- wait ca. 4mins, due to slow load-balancer service deleting"

sleep 240

kubectl get all -n dsc
kubectl get pvc -n dsc

kubectl get all -n consumer
kubectl get pvc -n consumer

kubectl get all -n provider
kubectl get pvc -n provider

echo ""
echo "-- if 6x no resources found, dsc deleting done"
echo ""

