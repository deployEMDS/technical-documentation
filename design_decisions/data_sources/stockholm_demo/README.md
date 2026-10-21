# Stockholm LEZ demo: SLB air and noise data for Trafikkontoret

SLB-analys (data provider) shares street-level NO2, PM10 and noise with Trafikkontoret (TK, data
consumer) to follow up the low emission zone. TK uses the data in the Hus för hus service.
Data sources are listed in [`../stockholm.md`](../stockholm.md); the connector requests reuse the shapes from test
[2.2.3.1A](../../../tests/data_product_publication/publication/publication_on_emds_catalogue/test_2_2_3_1a/test.md).

| File | What it does |
| --- | --- |
| `fetch_slb.sh` | Downloads hourly NO2 and PM10 for one station from the open SLB API (`open.slb.nu`) |
| `analyse_slb.sh` | Hours, mean, peak, latest, busiest hour and days above the WHO 2021 24 h guidelines (NO2 25, PM10 45 µg/m³) |
| `slb-tk-lez.workflow.yaml` | EDC calls: air and noise assets, a purpose-bound policy for TK, catalogue, negotiation, transfer |

## Run

```sh
sh fetch_slb.sh 14 "Norrlandsgatan 21"
sh analyse_slb.sh slb.json
```

Run on 2026-10-21 (07–21 Oct, 675 hourly records): NO2 mean 11.8 µg/m³, peak 44.3 on 19 Oct
11:00, above the WHO 24 h guideline on 1 of 13 full days; PM10 mean 9.1 µg/m³, 0 days above.

## Notes

- The connector steps have not been run against live connectors; hosts, DIDs and keys are placeholders.
- Noise comes from EnviroSuite and needs an API key. Keep it in the provider connector's vault
  (`envirosuite-key`), never in a browser page or this repository.
