#!/usr/bin/env sh
# Profile a GTFS feed: the quick analysis a consumer runs after the transfer.
# Usage: ./profile_gtfs.sh <gtfs-dir>
set -eu
d="${1:-gtfs}"

echo "== Operators (routes per agency)"
awk -F, 'NR==FNR{if(FNR>1)name[$1]=$2;next} FNR>1{c[$2]++} END{for(a in c)print c[a]"\t"name[a]}' \
  "$d/agency.txt" "$d/routes.txt" | sort -rn | awk -F'\t' '{printf "  %-24s %3d routes\n",$2,$1}'

echo "== Busiest lines (scheduled trips in feed window)"
awk -F'"' 'NR>1{split($0,f,",");print f[1]"\t"$2"\t"$4}' "$d/routes.txt" > /tmp/routes.$$
awk -F, 'NR>1{c[$1]++} END{for(r in c)print r"\t"c[r]}' "$d/trips.txt" \
  | sort -t"$(printf '\t')" -k2 -rn | head -8 \
  | awk -F'\t' 'NR==FNR{n[$1]=$2" "$3;next}{printf "  %-42s %5d trips\n",n[$1],$2}' /tmp/routes.$$ -
rm -f /tmp/routes.$$

echo "== Accessibility"
awk -F, 'NR>1{n++; if($(NF-1)==1)w++} END{printf "  wheelchair-boarding stops: %d of %d (%.0f%%)\n",w,n,100*w/n}' "$d/stops.txt"

echo "== Modes"
awk -F, 'NR==1{for(i=1;i<=NF;i++)if($i=="route_type")t=i} NR>1{c[$t]++} END{for(k in c)printf "  route_type %s: %d routes%s\n",k,c[k],(k==3?" (bus)":"")}' "$d/routes.txt"
