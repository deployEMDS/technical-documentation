# NEG-03: unauthenticated management API control

| Field | connector-a | connector-b |
| --- | --- | --- |
| Capture date | 2026-08-13 | 2026-08-13 |
| Request | `POST /api/management/v3/assets/request` | `POST /api/management/v3/assets/request` |
| Credentials supplied | None | None |
| Request body | Minimal read-only pagination query | Minimal read-only pagination query |
| Response | `401 Unauthorized` | `401 Unauthorized` |

The management API denied an unauthenticated read-only asset-query request for both connectors. This demonstrates local management API authentication enforcement, but it is not proof of DSP connector authentication and does not determine the `4.2.1.6` score.

An initial `GET` request to `/api/management/v3/assets` returned `405 Method Not Allowed`; it was not used as authentication evidence. The recorded `POST` request uses the EDC asset-query method and was denied before any asset data was returned.

## Collection method

```sh
curl --silent --show-error --output /dev/null --write-out 'HTTP %{http_code}\n' \
  --request POST \
  --header 'Content-Type: application/json' \
  --data '{"offset":0,"limit":1}' \
  https://<connector-host>/api/management/v3/assets/request
```
