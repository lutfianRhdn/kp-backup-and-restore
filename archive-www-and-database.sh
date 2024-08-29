DATE=$(date +"%Y-%m-%d")
SCRIPT_DIR=$(pwd)

echo "[BACKUP] Starting backup of all files..."
cd $SCRIPT_DIR/temp
tar -czvf $SCRIPT_DIR/backup/backup_$DATE.tar.gz *.tar.gz  
cd $SCRIPT_DIR

echo "[BACKUP] Backup of all files completed."