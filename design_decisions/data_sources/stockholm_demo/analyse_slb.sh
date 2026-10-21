#!/usr/bin/env sh
# Summarise an SLB timeseries response against the WHO 2021 guidelines.
# Usage: ./analyse_slb.sh [slb.json]
set -eu
f="${1:-slb.json}"

# One record per line: parameter <tab> local datetime <tab> value
tr '{' '\n' < "$f" | awk '
  match($0,/"parameter":"[^"]*"/)        { p=substr($0,RSTART+13,RLENGTH-14) }
  match($0,/"value":[-0-9.]+/)            { v=substr($0,RSTART+8,RLENGTH-8) }
  match($0,/"Datetime local":"[^"]*"/)   { t=substr($0,RSTART+18,19) }
  p!="" && v!="" && t!="" { print p "\t" t "\t" v; p=v=t="" }' > records.tsv

echo "== Station"
grep -o '"station":"[^"]*","kommun":"[^"]*","stationstyp":"[^"]*"' "$f" | head -1 | tr -d '"' | sed 's/,/  /g'

awk -F'\t' '
  BEGIN { who["NO2"]=25; who["PM10"]=45 }
  { n[$1]++; s[$1]+=$3
    if (!($1 in mx) || $3>mx[$1]) { mx[$1]=$3; mxt[$1]=$2 }
    if ($2>lt[$1]) { lt[$1]=$2; lv[$1]=$3 }
    if (!($1 in first) || $2<first[$1]) first[$1]=$2
    d=substr($2,1,10); ds[$1 SUBSEP d]+=$3; dn[$1 SUBSEP d]++
    h=substr($2,12,2); hs[$1 SUBSEP h]+=$3; hn[$1 SUBSEP h]++ }
  END {
    for (p in n) {
      days=0; above=0
      for (k in dn) { split(k,a,SUBSEP); if (a[1]==p && dn[k]>=18) { days++; if (ds[k]/dn[k]>who[p]) above++ } }
      best=-1; for (k in hn) { split(k,a,SUBSEP); if (a[1]==p && hs[k]/hn[k]>best) { best=hs[k]/hn[k]; bh=a[2] } }
      printf "== %s (ug/m3)\n", p
      printf "  hours            %d  (from %s)\n", n[p], substr(first[p],1,16)
      printf "  mean             %.1f\n", s[p]/n[p]
      printf "  peak hour        %.1f  at %s\n", mx[p], substr(mxt[p],1,16)
      printf "  latest           %.1f  at %s\n", lv[p], substr(lt[p],1,16)
      printf "  busiest hour     %s:00 local, mean %.1f\n", bh, best
      printf "  days above WHO 24h guideline (%d): %d of %d\n", who[p], above, days
    }
  }' records.tsv | sed 's/ug\/m3/µg\/m³/'
