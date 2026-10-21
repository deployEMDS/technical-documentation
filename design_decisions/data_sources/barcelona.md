Barcelona data sets that can be used for testing.

# AMB (Área metropolitana de Barcelona)
## Schedule

- **URL**: https://www.ambmobilitat.cat/OpenData/google_transit.zip
- **Type**: Open Data
- **Format**: GTFS

## Alerts

- **URL**: <https://www.ambmobilitat.cat/transit/alerts/alerts.bin>
- **Type**: Open Data
- **Format**: GTFS

## API

- **URL**: <https://api.ambmobilitat.cat/v1/swagger-ui.html>
- **Type**: API accessible via auth key
  - API Key request form: https://www.ambmobilitat.cat/Principales/OpenData.aspx
  - Swagger documentation: https://api.ambmobilitat.cat/v1/swagger-ui.html
- **Format**: JSON

## Demo

Scripts that validate and profile the AMB GTFS feed and an EDC workflow that publishes it as a data product: [`barcelona_demo/`](barcelona_demo/README.md).
