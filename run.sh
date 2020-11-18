#!/bin/bash
mariadb_name=mariadb-$SHORT_SETUP-$SHORT_ENV
echo "mariadb_name : $mariadb_name"
rabbitmq_name=rabbitmq-$SHORT_SETUP-$SHORT_ENV
echo "rabbitmq_name : $rabbitmq_name"

function containerIp {
  docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $1
}

if [[ $1  == "db" ]]; then
  docker run --rm --name $mariadb_name -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD -d mariadb:10.5
  while ! echo exit | nc -z $(containerIp $mariadb_name) 3306; do sleep 1; done
  docker exec -i $mariadb_name sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < ./server/sql/init.sql
elif [[ $1 == "dbr" ]]; then
  docker stop $mariadb_name
elif [[ $1 == "dbs" ]]; then
  docker inspect $mariadb_name
elif [[ $1 == "mq" ]]; then
  docker run --rm -d --hostname $rabbitmq_name --name $rabbitmq_name -p 8080:15672 rabbitmq:3-management
elif [[ $1 == "mqr" ]]; then
  docker stop $mariadb_name
elif [[ $1 == "mqs" ]]; then
  docker inspect $mariadb_name
else
  export MARIADB_IP=$(containerIp $mariadb_name)
  echo "MARIADB_IP : $MARIADB_IP"
  export RABBITMQ_IP=$(containerIp $rabbitmq_name)
  echo "RABITTEMQ_IP : RABBITMQ_IP"

  cd ./server
  # go run project.local/prepareGo/server
  bazel run server
  cd -
fi