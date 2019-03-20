#!/bin/bash
COLOR_RED='\033[1;31m';
COLOR_YELLOW='\033[1;49;33m';
COLOR_DARK_GRAY='\033[1;90m';
COLOR_CLEAN='\033[0m';


example() {
  echo -e "${COLOR_DARK_GRAY}=================================="
  echo "How to use it:"
  echo " create_user.sh <DATABASE-NAME> <NEW_USER> <PASSWORD> "
  echo
  echo " example:"
  echo "   sh /scripts/create_user.sh meu_banco meu_usuario minha-senha"
  echo -e "==================================${COLOR_CLEAN}"
}


DB_NAME=$1
DB_USER_NEW=$2
DB_PASSWORD=$3

if [ -z $DB_NAME ] || [ -z $DB_USER_NEW ] || [ -z $DB_PASSWORD ]; then
  echo -e "${COLOR_RED}Erro: Parâmetros esperados inválidos"
  example;
  exit 1;
fi

psql -U $POSTGRES_USER -c "CREATE USER $DB_USER_NEW WITH ENCRYPTED PASSWORD '$DB_PASSWORD'"
psql -U $POSTGRES_USER -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER_NEW"