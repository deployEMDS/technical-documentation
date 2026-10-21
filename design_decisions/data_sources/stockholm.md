Stockholm data sets that can be used for testing, from SLB-analys (City of Stockholm).

# SLB-analys

## Air quality time series

- **URL**: <https://open.slb.nu/api/timeseries/v1.1b/get-timeseries/>
- **Type**: Open Data (public access key `lvl1`)
- **Format**: JSON (`format=FME`), hourly values
- **Example**: station `Norrlandsgatan 21` (street canyon, urban traffic), parameters `NO2,PM10`

## Noise

- **Source**: EnviroSuite noise meters on Sveavägen and Norrlandsgatan
- **Type**: API accessible via API key (held by SLB-analys; do not commit keys)
- **Format**: JSON, daily Lday (dB)

## Demo

Scripts that fetch and check the air data against the WHO guidelines, and an EDC workflow in which SLB shares air and noise data with Trafikkontoret for low emission zone follow-up: [`stockholm_demo/`](stockholm_demo/README.md).
