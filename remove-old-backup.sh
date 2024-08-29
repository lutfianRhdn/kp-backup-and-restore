#!/bin/bash

# Define the backup directory
BACKUP_DIR="backup"

# Get today's date and the date 7 days ago
TODAY=$(date +"%Y-%m-%d")
SEVEN_DAYS_AGO=$(date -d "-7 days" +"%Y-%m-%d")

# Ensure the backup directory exists
if [ ! -d "$BACKUP_DIR" ]; then
    echo "[ERROR] Directory $BACKUP_DIR does not exist."
    exit 1
fi

# Loop through files in the backup directory
for file in "$BACKUP_DIR"/backup_*.tar.gz; do
    # Extract the date from the filename
    FILE_DATE=$(basename "$file" | sed -E 's/backup_([0-9]{4}-[0-9]{2}-[0-9]{2})\.tar\.gz/\1/')

    # Check if the extracted date is earlier than SEVEN_DAYS_AGO
    if [[ "$FILE_DATE" < "$SEVEN_DAYS_AGO" ]]; then
        echo "Removing $file"
        rm "$file"
    fi
done

echo "[CLEANUP] Removed files older than 7 days from the backup directory."
