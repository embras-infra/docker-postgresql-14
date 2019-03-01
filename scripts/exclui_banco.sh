#!/bin/bash
DB_NAME=$1

if [ -z $1 ]; then
  echo "Passe como parametro o nome do banco a ser apagado"
  exit 1
fi


## Mata todos os processos referente ao banco
ps -aux | grep $DB_NAME | awk '{ print $2 }' | sudo xargs kill -9

#### Mata as conexões com o banco
sudo docker exec -i database-postgresql psql -U postgres -c "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = '$DB_NAME' AND pid <> pg_backend_pid();"

#### Exclui o Banco
sudo docker exec -i database-postgresql psql -U postgres -c "DROP DATABASE $DB_NAME;"
