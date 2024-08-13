DATE=$(date +"%Y-%m-%d")
echo "[BACKUP] Starting backup of all files..."
tar -czvf backup_$DATE.tar.gz *.tar.gz
echo "[BACKUP] Backup of all files completed."