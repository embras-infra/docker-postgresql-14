#!/bin/bash

SCRIPT_PATH=$(dirname $(realpath $0))
DOCKER_PATH=$(dirname $SCRIPT_PATH)

echo "=================================="
echo "== docker exec -it postgresql /bin/bash $@ "
echo "=================================="
(cd $DOCKER_PATH; docker exec -it postgresql /bin/bash $@ )