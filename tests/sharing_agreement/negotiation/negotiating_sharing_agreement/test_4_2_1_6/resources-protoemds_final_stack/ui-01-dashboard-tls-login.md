# UI-01: dashboard TLS and access model

This supplementary platform check assesses the connector dashboard route. It is not a Functional Suitability score input for test `4.2.1.6`.

| Field | connector-a | connector-b |
| --- | --- | --- |
| Capture date | 2026-08-13 | 2026-08-13 |
| Dashboard route | `https://connector-a.194-164-194-95.sslip.io/dashboard/` | `https://connector-b.194-164-194-95.sslip.io/dashboard/` |
| HTTPS response | `200`, `text/html` | `200`, `text/html` |
| HTTP response | `308` redirect to HTTPS | `308` redirect to HTTPS |
| UI deployment | `connector-a-uii2connector`, ready `1/1` | `connector-b-uii2connector`, ready `1/1` |
| UI service | `connector-a-uii2connector`, ClusterIP port `3001` | `connector-b-uii2connector`, ClusterIP port `3001` |
| Proxy route | `/dashboard/` to the UI service | `/dashboard/` to the UI service |

## Access model

The dashboard is a static single-page application. Its client code stores the entered connector password under `connector_password` in browser session storage and sends it as `X-Api-Key` on management API requests. The dashboard HTTPS response did not set a server-side session cookie.

The UI workload imports only a ConfigMap. Its configuration key list contains `config.json` and no credential-like key name. The management API key remains in the control-plane Secret; its value was not exposed through the UI deployment or this evidence artifact.

## Controlled read-only access check

The access check reproduced the dashboard client's API-key request model with a single read-only asset query against `connector-a`:

| Check | Outcome |
| --- | --- |
| No `X-Api-Key` header | `401 Unauthorized` |
| Approved local `X-Api-Key` | `200 OK`; one result requested, content not retained |
| Dashboard session cookie | Absent |

The result confirms that the dashboard's management operations are protected by the connector API key and that the dashboard itself does not establish a server-side login session. Closing the browser tab or clearing browser session storage removes the client-side stored password; no logout endpoint was identified or invoked.

## Boundary

This check confirms dashboard TLS and its implemented API-key access model. It does not prove DSP connector authentication and does not change the proposed `4.2.1.6` score.

## Collection method

The check used HTTPS/HTTP header requests, proxy and workload metadata, and one locally authenticated read-only management API request. No dashboard form submission, resource mutation, cookie value, API key, or management response body was retained.
