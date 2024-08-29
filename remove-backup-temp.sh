
# # Get the current date
# DATE=$(date +"%Y-%m-%d")


# rm *.sql
# echo "[BACKUP] Starting All Temporary Backup...."

# rm "./temp/$DATE"_FILE.tar.gz
# rm "./temp/$DATE"_DATABASE.tar.gz
# echo "[BACKUP] All Temporary Backup Removed"
echo "[BACKUP] Starting All Temporary Backup...."
rm ./temp/*
echo "[BACKUP] All Temporary Backup Removed"