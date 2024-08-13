DATE=$(date +"%Y-%m-%d")

echo "[DATABASE] Starting Archiving of all databases..."
tar -czvf all_databases_backup_$DATE.tar.gz *.sql
echo "[DATABASE] Archiving of all databases completed."