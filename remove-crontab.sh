#!/bin/bash

# Define the cron schedule and backup script location
CRON_SCHEDULE="0 2 * * *" # Example: Runs every day at 2 AM
BACKUP_SCRIPT="./backup.sh"

# Remove the specific cron job
(crontab -l 2>/dev/null | grep -v -F "$CRON_SCHEDULE $BACKUP_SCRIPT") | crontab -

echo "Removed cron job for $BACKUP_SCRIPT scheduled at $CRON_SCHEDULE"