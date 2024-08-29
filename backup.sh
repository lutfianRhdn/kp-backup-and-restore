
echo "[BACKUP] Starting Backup Process"
bash ./archive-www.sh
bash ./export-database.sh
bash ./archive-sql.sh
bash ./archive-www-and-database.sh
bash ./remove-backup-temp.sh
bash ./remove-old-backup.sh
echo "[BACKUP] Backup Process Completed"
