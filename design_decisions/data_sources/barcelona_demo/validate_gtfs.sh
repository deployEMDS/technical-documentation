#!/usr/bin/env sh
# Validate an unpacked GTFS feed before it is registered as an EDC asset.
# Usage: ./validate_gtfs.sh <gtfs-dir>
set -eu
d="${1:-gtfs}"
fail=0

echo "== Required files"
for f in agency stops routes trips stop_times; do
  if [ -f "$d/$f.txt" ]; then echo "  ok   $f.txt"; else echo "  MISS $f.txt"; fail=1; fi
done
if [ -f "$d/calendar.txt" ] || [ -f "$d/calendar_dates.txt" ]; then echo "  ok   calendar(_dates).txt"; else echo "  MISS calendar"; fail=1; fi

echo "== Record counts"
for f in agency routes stops trips stop_times; do
  printf '  %-11s %8d\n' "$f" "$(($(wc -l < "$d/$f.txt") - 1))"
done

echo "== Referential integrity"
tmp=$(mktemp -d)
awk -F, 'NR>1{print $1}' "$d/routes.txt" | sort -u > "$tmp/routes"
awk -F, 'NR>1{print $1}' "$d/stops.txt"  | sort -u > "$tmp/stops"
awk -F, 'NR>1{print $3}' "$d/trips.txt"  | sort -u > "$tmp/trips"
r=$(awk -F, 'NR>1{print $1}' "$d/trips.txt"      | sort -u | comm -23 - "$tmp/routes" | wc -l)
s=$(awk -F, 'NR>1{print $4}' "$d/stop_times.txt" | sort -u | comm -23 - "$tmp/stops"  | wc -l)
t=$(awk -F, 'NR>1{print $1}' "$d/stop_times.txt" | sort -u | comm -23 - "$tmp/trips"  | wc -l)
rm -rf "$tmp"
echo "  trips -> routes          orphans: $r"
echo "  stop_times -> stops      orphans: $s"
echo "  stop_times -> trips      orphans: $t"
[ "$r$s$t" = "000" ] || fail=1

echo "== Feed validity"
awk -F, 'NR==2{printf "  publisher %s, valid %s to %s, version %s\n",$1,$4,$5,$6}' "$d/feed_info.txt"

if [ "$fail" -eq 0 ]; then echo "RESULT: PASS"; else echo "RESULT: FAIL"; exit 1; fi
