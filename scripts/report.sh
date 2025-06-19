#!/bin/bash

DB="monitor_db"
USER="root"
PASS="parrot"
OUT_DIR="$HOME/linux_incident_monitor/reports"
DATE=$(date +%F)
OUT_FILE="$OUT_DIR/incident_report_$DATE.csv"

mkdir -p "$OUT_DIR"

sudo mariadb -u $USER -p$PASS -D $DB -e "SELECT * FROM incidents;" > "$OUT_FILE"

echo "✅ Report generated: $OUT_FILE"
