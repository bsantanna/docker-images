#!/bin/bash

MYSQL_ENV_MYSQL_ROOT_PASSWORD="my_secret_pw"

docker run -i --link jira-mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"' < ./createdb.sql
