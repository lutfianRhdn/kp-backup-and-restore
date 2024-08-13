#!/bin/bash

# Get the current script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set the source directory
SOURCE_DIR="/var/www"

# Get the current date
DATE=$(date +"%Y-%m-%d")

# Define the output archive file name
ARCHIVE_NAME="www_backup_$DATE.tar.gz"

# Create the tar.gz archive
echo "[PROJECTS] Starting backup of $SOURCE_DIR..."
tar -czf "$SCRIPT_DIR/$ARCHIVE_NAME" -C "$SOURCE_DIR" .
echo "[PROJECTS] Backup of $SOURCE_DIR completed."
