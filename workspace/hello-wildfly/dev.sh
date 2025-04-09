#!/bin/bash
export POSTGRESQL_DATABASE=meu_banco
export POSTGRESQL_PASSWORD=minha_senha
export POSTGRESQL_USER=meu_usuario

docker run -d \
    -e POSTGRES_PASSWORD=$POSTGRESQL_PASSWORD \
    -e POSTGRES_USER=$POSTGRESQL_USER \
    -e POSTGRES_DB=$POSTGRESQL_DATABASE \
    -p 5432:5432 \
    --name postgres \
    postgres
mvn clean package wildfly:dev
docker rm postgres -fv