#!/bin/bash
export PATH=/usr/bin:/bin:/usr/sbin:/sbin
export LANG=C

SCAN_DIR="/"
LOG_DIR="/home/thts/Project/ClamAV/Log"
LOG_FILE="$LOG_DIR/full_system_scan_$(date +%F_%H-%M-%S).log"

mkdir -p "$LOG_DIR"

echo "===== Full system scan started at $(date) =====" >> "$LOG_FILE"

# Count total files first
TOTAL=$(find "$SCAN_DIR" -type f 2>/dev/null | wc -l)
COUNT=0
NEXT_MILESTONE=5   # log every 5% milestone

# Temporary file to collect raw scan output
TMP_SCAN=$(mktemp)

# Scan each file individually, capture output
find "$SCAN_DIR" -type f 2>/dev/null | while read -r file; do
    COUNT=$((COUNT+1))
    /usr/bin/clamscan "$file" >> "$TMP_SCAN"

    # Calculate percentage
    PERCENT=$((COUNT*100/TOTAL))

    # Log every 5% milestone
    if [ "$PERCENT" -ge "$NEXT_MILESTONE" ]; then
        echo ">>> Scan progress: $PERCENT% completed at $(date)" >> "$LOG_FILE"
        NEXT_MILESTONE=$((NEXT_MILESTONE+5))
    fi
done

# Extract and log only the final summary
SUMMARY=$(sed -n '/SCAN SUMMARY/,$p' "$TMP_SCAN")

{
  echo ""
  echo "----------------------------------- FINAL SCAN SUMMARY -----------------------------------"
  echo "$SUMMARY"
  echo "------------------------------------------------------------------------------------------"
} >> "$LOG_FILE"

rm -f "$TMP_SCAN"

echo "===== Full system scan finished at $(date) =====" >> "$LOG_FILE"
