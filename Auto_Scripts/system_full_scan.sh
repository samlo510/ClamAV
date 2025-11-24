#!/bin/bash
export PATH=/usr/bin:/bin:/usr/sbin:/sbin
export LANG=C   # safe default for cron

# Directories
DOWNLOAD_DIR="/"
LOG_DIR="/home/thts/Project/ClamAV/Log"

# Use both date and time in filename to avoid overwriting/appending duplicates
LOG_FILE="$LOG_DIR/full_system_scan_$(date +%F_%H-%M-%S).log"

# Ensure log directory exists
mkdir -p "$LOG_DIR"

# Record start time
echo "===== Full system scan started at $(date) =====" >> "$LOG_FILE"

# Run full system scan, show everything on terminal, capture output
SCAN_OUTPUT=$(/usr/bin/clamscan -r "$DOWNLOAD_DIR" | tee /dev/tty)

# Extract summary block (from "SCAN SUMMARY" to end)
SUMMARY=$(echo "$SCAN_OUTPUT" | sed -n '/SCAN SUMMARY/,$p')

# Log summary only
{
  echo ""
  echo "----------------------------------- SCAN SUMMARY -----------------------------------"
  echo "$SUMMARY"
  echo "------------------------------------------------------------------------------------"
} >> "$LOG_FILE"

# Record finish time
echo "===== Full system scan finished at $(date) =====" >> "$LOG_FILE"
