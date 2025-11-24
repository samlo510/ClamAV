#!/bin/bash
export PATH=/usr/bin:/bin:/usr/sbin:/sbin
export LANG=C   # safe default for cron

DOWNLOAD_DIR="/home/thts/下載"
LOG_DIR="/home/thts/Project/ClamAV/Log"
LOG_FILE="$LOG_DIR/download_scan_$(date +%F).log"

mkdir -p "$LOG_DIR"

# Run ClamAV scan (no --summary option!)
/usr/bin/clamscan -r "$DOWNLOAD_DIR" --infected --log="$LOG_FILE"

# Append formatted summary block
{
  echo ""
  grep -E "Known viruses|Engine version|Scanned directories|Scanned files|Infected files|Data scanned|Time" "$LOG_FILE"
} >> "$LOG_FILE"

echo "Download folder scan completed. Summary appended to: $LOG_FILE"
