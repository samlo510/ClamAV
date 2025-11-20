#!/bin/bash

# Log directory and file
LOG_DIR="/home/thts/Project/ClamAV/Log"
LOG_FILE="$LOG_DIR/full_system_scan_$(date +%F).log"

# Ensure log directory exists
mkdir -p "$LOG_DIR"

# Record start time
echo "===== Full system scan started at $(date) =====" | tee -a "$LOG_FILE"

# Run full system scan
sudo clamscan -r / | tee -a "$LOG_FILE"

# Record finish time
echo "===== Full system scan finished at $(date) =====" | tee -a "$LOG_FILE"
