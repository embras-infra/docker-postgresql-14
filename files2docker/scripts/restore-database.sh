#!/bin/bash
COLOR_RED='\033[1;31m';
COLOR_YELLOW='\033[1;49;33m';
COLOR_DARK_GRAY='\033[1;90m';
COLOR_CLEAN='\033[0m';


example() {
  echo -e "${COLOR_DARK_GRAY}=================================="
  echo "How to use it:"
  echo " restore-database.sh <FILE_SQL> <DATABASE_NAME>"
  echo
  echo " example:"
  echo "   sh /scripts/restore-database.sh meu_banco.sql meu_banco"
  echo -e "==================================${COLOR_CLEAN}"
}


FILE_SQL=$1
DATABASE_NAME=$2

if [ -z $FILE_SQL ] || [ -z $DATABASE_NAME ]; then
  echo -e "${COLOR_RED}Erro: Parâmetros esperados inválidos"
  example;
  exit 1;
fi

psql -U $POSTGRES_USER -c "CREATE DATABASE $DATABASE_NAME;"
psql -U $POSTGRES_USER -c "GRANT ALL PRIVILEGES ON DATABASE $DATABASE_NAME to sysdba;"
psql -U $POSTGRES_USER -d $DATABASE_NAME -f $FILE_SQL
