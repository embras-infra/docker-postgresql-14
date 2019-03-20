#!/bin/bash
FILE_SQL=$1
DB_NAME=$2

if [ -z $1 ] || [ -z $2 ]; then
  echo "Passe como parametro .sql a ser restaurado e o nome do banco a ser criado"
  exit 1
fi

echo "POSTGRES_USER=$POSTGRES_USER"
echo "FILE_SQL=$FILE_SQL"
echo "DB_NAME=$DB_NAME"

psql -U $POSTGRES_USER -c "CREATE DATABASE $DB_NAME;"
psql -U $POSTGRES_USER -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME to sysdba;"
psql -U $POSTGRES_USER -d $DB_NAME -f $FILE_SQL
