# Barcelona demo: AMB bus GTFS through the data space

An end-to-end demo of the AMB bus GTFS feed listed in [`../barcelona.md`](../barcelona.md):
validate and profile the feed, then publish, discover, negotiate and transfer it through EDC
connectors using the same request shapes as test
[2.2.3.1A](../../../tests/data_product_publication/publication/publication_on_emds_catalogue/test_2_2_3_1a/test.md).

| File | What it does | Run where |
| --- | --- | --- |
| `validate_gtfs.sh` | Checks required files, record counts, referential integrity and feed validity dates | Anywhere with `sh`, `awk`, `sort`, `comm` |
| `profile_gtfs.sh` | Operators, busiest lines, wheelchair-accessible stops, modes | Same |
| `bcn-amb-gtfs.workflow.yaml` | EDC management API calls: asset, policy, contract definition, catalogue, negotiation, transfer | Bruno or curl, against a provider and a consumer connector |

## Run the data scripts

```sh
curl -sL -o amb_gtfs.zip https://www.ambmobilitat.cat/OpenData/google_transit.zip
unzip -o -q amb_gtfs.zip -d gtfs
sh validate_gtfs.sh gtfs
sh profile_gtfs.sh gtfs
```

Run on 2026-10-21 against feed version 20261021 (8,295,351 bytes,
sha256 `bc87858b215c1bdf9069a593a0247edd848ad66fb910d5a651aac64823cddc3b`): validation PASS,
11 operators, 140 routes, 4,970 stops, 30,145 trips, 950,579 stop times.

## Connector steps

The workflow file reuses the request shapes from test 2.2.3.1A. It needs a running provider and
consumer connector and their management API key. These steps have not been executed against a
live connector yet; fill in the hosts, the key and the MobilityDCAT-AP theme URI from your own
environment, and never commit them.
