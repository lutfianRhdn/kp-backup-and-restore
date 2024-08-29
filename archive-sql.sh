DATE=$(date +"%Y-%m-%d")
SCRIPT_DIR=$(dirname "$0")
ls $SCRIPT_DIR/temp/*.sql
echo "[DATABASE] Starting Archiving of all databases..."
cd $SCRIPT_DIR/temp
tar -czvf $DATE""_DATABASE.tar.gz *.sql
cd $SCRIPT_DIR
echo "[DATABASE] Archiving of all databases completed."