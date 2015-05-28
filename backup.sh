#!/bin/bash
BACKUP=/backup
NOW="$(date +"%d-%m-%Y_%H%M")"
OLD="$(date +"%d-%m-%Y" -d '-7 day')"
# all databases
mysqldump -u $MUSER -p$MPASS --all-databases --single-transaction > "$BACKUP/sql/$NOW/all_databases.sql"
# backup each base of the database
DBS="$(mysql -u $MUSER -h $MHOST -p$MPASS -Bse 'show databases')"
mkdir "$BACKUP/sql/$NOW"
for db in $DBS
do
	mysqldump -u $MUSER -p$MPASS $db --single-transaction > "$BACKUP/sql/$NOW/$db.sql"
done
# delete old sql
rm -r $BACKUP/sql/$OLD*
