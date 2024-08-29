#!/bin/bash

# Define the cron schedule and backup script location
CRON_SCHEDULE="0 2 * * *" # Example: Runs every day at 2 AM
BACKUP_SCRIPT="./backup.sh"

# Add the cron job
(crontab -l 2>/dev/null; echo "$CRON_SCHEDULE $BACKUP_SCRIPT") | crontab -

echo "Crontab configured to run $BACKUP_SCRIPT on schedule: $CRON_SCHEDULE"
