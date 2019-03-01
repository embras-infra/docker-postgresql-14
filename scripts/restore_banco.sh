#!/bin/bash
FILE_SQL=$1
DB_NAME=$2

if [ -z $1 ] || [ -z $2 ]; then
  echo "Passe como parametro o .sql a ser restaurado e o nome do banco a ser criado"
  exit 1
fi

docker exec -i database-postgresql psql -U postgres -c "CREATE DATABASE $DB_NAME;"
docker exec -i database-postgresql psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME to sysdba;"
cat $FILE_SQL | docker exec -i database-postgresql psql -U sysdba -d $DB_NAME
