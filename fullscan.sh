#!/bin/bash

# Log directory and file
LOG_DIR="/home/thts/Project/ClamAV/Log"
LOG_FILE="$LOG_DIR/full_system_scan_$(date +%F).log"

# Ensure log directory exists
mkdir -p "$LOG_DIR"

# Record start time
echo "===== Full system scan started at $(date) =====" | tee -a "$LOG_FILE"

# Run full system scan and capture output
SCAN_OUTPUT=$(sudo clamscan -r /)

# Extract infected files (lines ending with "FOUND")
INFECTED=$(echo "$SCAN_OUTPUT" | grep "FOUND")

# Extract summary block
SUMMARY=$(echo "$SCAN_OUTPUT" | grep -A20 "SCAN SUMMARY")

# Log infected files if any
if [[ -n "$INFECTED" ]]; then
    echo "----- Infected files detected -----" | tee -a "$LOG_FILE"
    echo "$INFECTED" | tee -a "$LOG_FILE"
    echo "-----------------------------------" | tee -a "$LOG_FILE"
else
    echo "No infected files found." | tee -a "$LOG_FILE"
fi

# Log summary
echo "$SUMMARY" | tee -a "$LOG_FILE"

# Record finish time
echo "===== Full system scan finished at $(date) =====" | tee -a "$LOG_FILE"
