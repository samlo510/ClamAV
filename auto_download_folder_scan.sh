#!/bin/bash
export PATH=/usr/bin:/bin:/usr/sbin:/sbin
export LANG=C   # safe default for cron

DOWNLOAD_DIR="/home/thts/下載"
LOG_DIR="/home/thts/Project/ClamAV/Log"
LOG_FILE="$LOG_DIR/download_scan_$(date +%F).log"

mkdir -p "$LOG_DIR"

# Run ClamAV scan and capture output
SCAN_OUTPUT=$(/usr/bin/clamscan -r "$DOWNLOAD_DIR" --infected)

# Save full scan output (without ClamAV’s built-in summary header)
echo "$SCAN_OUTPUT" | sed '/SCAN SUMMARY/,$d' > "$LOG_FILE"

# Append aligned summary block
{
  echo ""
  echo "----------------------------------- SCAN SUMMARY -----------------------------------"
  echo "$SCAN_OUTPUT" | grep -E "Known viruses|Engine version|Scanned directories|Scanned files|Infected files|Data scanned|Data read|Time|Start Date|End Date"
  echo "------------------------------------------------------------------------------------"
} >> "$LOG_FILE"

echo "Download folder scan completed. Summary appended to: $LOG_FILE"
