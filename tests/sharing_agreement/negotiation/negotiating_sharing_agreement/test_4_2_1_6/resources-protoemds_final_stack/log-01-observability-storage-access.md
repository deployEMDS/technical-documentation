# LOG-01: observability storage and access

This supplementary platform check assesses storage, transport, and application-access controls for collected observability data. It does not change the Functional Suitability score for test `4.2.1.6`.

## Live inventory

| Component | Deployment state | Service exposure | Persistence or access configuration |
| --- | --- | --- |
| Elasticsearch | Ready `1/1` | ClusterIP port `9200` | Data mounted from PVC `observa-elasticsearch-data` |
| Kibana | Ready `1/1` | ClusterIP port `5601` | Connects to Elasticsearch with a Secret-backed password |
| Jaeger | Ready `1/1` | ClusterIP UI/API port `16686` | Stores spans in Elasticsearch with Secret-backed credentials |
| OpenTelemetry Collector | Ready `1/1` | ClusterIP ports `4317`, `4318`, `13133` | Sends telemetry to Jaeger |

No Ingress, Role, RoleBinding, or NetworkPolicy resource was present in namespace `observa` at capture time. The components are not publicly exposed through a Kubernetes Ingress, but port-forward access through a privileged Kubernetes identity reaches their application endpoints.

## Storage and encryption assessment

| Check | Outcome |
| --- | --- |
| Elasticsearch persistence | Bound `10Gi` ReadWriteOnce PVC on storage class `ionos-enterprise-hdd`, mounted at `/usr/share/elasticsearch/data` |
| Storage-class metadata | IONOS CSI HDD volume; no encryption-at-rest setting is published in PVC, PV, or StorageClass metadata |
| Elasticsearch application authentication | Enabled; password injected from Secret reference |
| Elasticsearch HTTP TLS | Disabled in the running deployment |
| Elasticsearch transport TLS | Disabled in the running deployment |
| Kibana to Elasticsearch transport | Configured as `http://observa-elasticsearch:9200` |
| Jaeger to Elasticsearch transport | Configured as `http://observa-elasticsearch:9200` |
| OpenTelemetry Collector to Jaeger | Configured with `tls.insecure: true` |

The Elasticsearch persistence layer exists, but secure storage cannot be claimed: encryption at rest is unverified, and the recorded internal telemetry/storage channels do not use TLS.

## Controlled application-access checks

Short-lived direct pod port-forwards were used because the observability services are ClusterIP-only and the Jaeger Service UI port is misconfigured: service port `16686` targets `16687`, while the Jaeger pod listens on `16686`.

| Endpoint | Unauthenticated outcome | Approved authenticated outcome |
| --- | --- | --- |
| Elasticsearch root API | `401 Unauthorized` | `200 OK` for a read-only cluster-health request; response body not retained |
| Kibana `/api/status` | `401 Unauthorized` | `200 OK`; response body not retained |
| Kibana `/app/discover` | `302` redirect to `/login` | Not separately exercised; Kibana status access confirmed with approved credential |
| Jaeger UI | `200 OK` | Not applicable; UI did not require application authentication |
| Jaeger `/api/services` | `200 OK`; nine service names returned, names not retained | Not applicable; API did not require application authentication |
| Jaeger known negotiation trace | `200 OK`; 78 spans returned, trace content not retained | Not applicable; API did not require application authentication |

The unauthenticated Jaeger trace result is a material access-control finding: any workload or user able to reach the internal Jaeger endpoint can query trace data without application authentication.

## Findings and handoff

1. Elasticsearch persistence is present, but encryption at rest is not evidenced.
2. Elasticsearch, Kibana, Jaeger, and OTel internal transport settings do not provide TLS protection for the recorded paths.
3. Jaeger application endpoints permit unauthenticated trace access within the cluster network.
4. No explicit observability namespace NetworkPolicy or RBAC resources were found.

Authorization to negotiation logs, status messages, and APIs belongs to [test `4.2.3.1`](../../../refusal_or_registration_of_sharing_agreement/test_4_2_3_1/test.md). Trace-viewer confidentiality also relates to [test `4.2.4.2`](../../../update_observability_registry/test_4_2_4_2/test.md). Log persistence, access, and immutable-storage expectations relate to [test `5.3.3.4`](../../../../../data_sharing/post-sharing_activities/log_data_sharing_transaction/test_5_3_3_4/test.md).

## Collection method

The check used read-only Kubernetes metadata, service and pod port inspection, and short-lived direct pod port-forwards. It queried only status endpoints, a service-name count, and the known negotiation trace span count. No secret value, log content, trace content, session cookie, or stored observability record was retained.
