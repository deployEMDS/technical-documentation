# ENV-01: live cluster inventory

| Field | Observed value |
| --- | --- |
| Capture date | 2026-08-13 |
| Kubernetes context | `cluster-admin@EMDS-PROD` |
| Deployment model | CaaS / IONOS-managed deployment |
| Deployment namespace | `connector` |
| Connector releases | `connector-a`, `connector-b` |
| Connector chart | `edc-i2cat-1.0.0` |
| Connector image revision | `9916cc56b682ae70988300d301b752ca8eb05121` |
| Control-plane base image | `ghcr.io/deployemds/emds-edc-connector:controlplane-9916cc56b682ae70988300d301b752ca8eb05121` |
| Identity-hub base image | `ghcr.io/deployemds/emds-edc-connector:identity-hub-9916cc56b682ae70988300d301b752ca8eb05121` |
| Data-plane base image | `ghcr.io/deployemds/emds-edc-connector:dataplane-9916cc56b682ae70988300d301b752ca8eb05121` |
| Observability namespace | `observa` |
| Observability components | OpenTelemetry Collector, Jaeger, Elasticsearch, Kibana, Health Monitor |

## Connector readiness and public routes

| Connector | Control plane | Identity hub | NGINX proxy | Ingress hostname | Certificate |
| --- | --- | --- | --- | --- | --- |
| `connector-a` | Ready `1/1` | Ready `1/1` | Ready `1/1` | `connector-a.194-164-194-95.sslip.io` | `connector-a-tls`: Ready, `letsencrypt-prod`, not expired |
| `connector-b` | Ready `1/1` | Ready `1/1` | Ready `1/1` | `connector-b.194-164-194-95.sslip.io` | `connector-b-tls`: Ready, `letsencrypt-prod`, not expired |

Both ingress resources use the `nginx` class, expose ports `80` and `443`, and resolve through the same public ingress address. No Gateway API resources are installed. No NetworkPolicy resources were returned for the `connector` namespace.

## Release and observability status

`connector-a` is a deployed Helm release. `connector-b` is reported as `failed` by Helm, although all inspected connector workloads and pods were ready and running. This discrepancy must be reviewed with the deployment owner, but it does not currently prevent read-only TLS or DSP reachability checks.

The `observa` Helm release is also reported as `failed`; its inspected Elasticsearch, Jaeger, Kibana, OpenTelemetry Collector, and Health Monitor deployments were all ready and their pods were running. Trace correlation can therefore be attempted, subject to the deployed access path.

## Collection method

The inventory was collected without reading Secret data or modifying the cluster using:

```sh
kubectl --context cluster-admin@EMDS-PROD get ns
helm --kube-context cluster-admin@EMDS-PROD list --all-namespaces
kubectl --context cluster-admin@EMDS-PROD get deploy,sts,ds,pods,svc,ingress,certificate -n connector -o wide
kubectl --context cluster-admin@EMDS-PROD get deploy,sts,ds,pods,svc,ingress,certificate -n observa -o wide
kubectl --context cluster-admin@EMDS-PROD get networkpolicy -n connector -o wide
```