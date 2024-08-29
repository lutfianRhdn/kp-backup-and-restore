#!/bin/bash

# Get the current script directory
SCRIPT_DIR=$(dirname "$0")

# Set the source directory
SOURCE_DIR="/var/www"

# Get the current date
DATE=$(date +"%Y-%m-%d")

# Define the output archive file name
ARCHIVE_NAME="$DATE""_FILE.tar.gz"

# Create the tar.gz archive
echo "[PROJECTS] Starting backup of $SOURCE_DIR..."
cd $SCRIPT_DIR/temp
tar -czf "$SCRIPT_DIR/$ARCHIVE_NAME" -C "$SOURCE_DIR" .
cd $SCRIPT_DIR
echo "[PROJECTS] Backup of $SOURCE_DIR completed."
