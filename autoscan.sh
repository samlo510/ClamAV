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
    echo "Scanning $FILEPATH at $(date)" >> $LOG_FILE
    clamscan "$FILEPATH" --log=$LOG_FILE
done
