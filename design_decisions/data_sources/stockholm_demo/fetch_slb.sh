#!/usr/bin/env sh
# Fetch hourly NO2 and PM10 for one SLB station from the open SLB API.
# Usage: ./fetch_slb.sh [days] [station]   (defaults: 14, "Norrlandsgatan 21")
set -eu
days="${1:-14}"
station="${2:-Norrlandsgatan 21}"
from=$(date -u -d "$days days ago" '+%Y-%m-%d %H:%M')

curl -s --max-time 60 -G "https://open.slb.nu/api/timeseries/v1.1b/get-timeseries/" \
  --data-urlencode "key=lvl1" \
  --data-urlencode "stations=$station" \
  --data-urlencode "parameters=NO2,PM10" \
  --data-urlencode "format=FME" \
  --data-urlencode "from_datetime=$from" \
  -o slb.json -w "HTTP %{http_code}  %{size_download} bytes  from $from\n"
