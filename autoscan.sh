#!/bin/bash

WATCH_DIR="/home/thts/下載"
LOG_FILE="/home/thts/Project/ClamAV/Log/auto_scan.log"

# Ensure log directory exists
sudo mkdir -p /home/thts/Project/ClamAV/Log
sudo touch $LOG_FILE
sudo chown $USER:$USER $LOG_FILE

inotifywait -m "$WATCH_DIR" -e close_write |
while read -r directory events filename; do
    FILEPATH="$directory$filename"
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

    echo "[$TIMESTAMP] Scanning $FILEPATH" | tee -a $LOG_FILE

    # Run clamscan and capture output
    OUTPUT=$(clamscan "$FILEPATH")

    # Extract the "Data read" value
    DATA=$(echo "$OUTPUT" | grep "Data read:" | awk '{print $3}')

    # Get actual file size in KB
    FILESIZE=$(stat -c%s "$FILEPATH" 2>/dev/null)
    FILESIZE_KB=$(echo "scale=2; $FILESIZE/1024" | bc)

    # Only save the full output if Data read > 0
    if [[ $(echo "$DATA > 0" | bc) -eq 1 ]]; then
        echo "$OUTPUT" | tee -a $LOG_FILE
        echo -e "\n-----------------------------\n" | tee -a $LOG_FILE
    else
        echo "[$TIMESTAMP] Skipped $FILEPATH (no data read, size: ${FILESIZE_KB} KB)" | tee -a $LOG_FILE
        echo -e "\n-----------------------------\n" | tee -a $LOG_FILE
    fi
done
