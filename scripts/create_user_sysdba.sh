# Assumes the database container is named 'db_postgres'
DOCKER_DB_NAME="postgresql"
# DB_NAME=cm_pinda
DB_NAME=postgres
DB_USER_POSTGRES=postgres
DB_USER_NEW=sysdba
DB_PASSWORD=wildfire

echo $DOCKER_DB_NAME
echo $DB_NAME
echo $DB_USER_POSTGRES
echo $DB_PASSWORD
echo
echo

if [ -z $DOCKER_DB_NAME ]
then
  docker-compose up -d
fi

echo "11"  
docker exec -i $DOCKER_DB_NAME psql -U $DB_USER_POSTGRES -c "CREATE USER $DB_USER_NEW WITH ENCRYPTED PASSWORD '$DB_PASSWORD'"

echo "2222"
docker exec -i $DOCKER_DB_NAME psql -U $DB_USER_POSTGRES -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER_NEW"

echo "restore finished."

