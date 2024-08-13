
# MySQL credentials
USER="root"
PASSWORD="password"
HOST="127.0.0.1"

# Get a list of all databases
databases=$(mysql -u $USER -p$PASSWORD -h $HOST -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema)")
echo "[DATABASE] Starting database export"
# Export each database into a separate file
for db in $databases; do
    echo "[DATABASE] Exporting database: $db"
    mysqldump -u $USER -p$PASSWORD -h $HOST --databases $db > "${db}.sql"
done

echo "[DATABASE] All databases have been exported."