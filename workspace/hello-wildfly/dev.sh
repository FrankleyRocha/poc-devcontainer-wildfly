#!/bin/bash
export POSTGRESQL_DATABASE=meu_banco
export POSTGRESQL_PASSWORD=minha_senha
export POSTGRESQL_USER=meu_usuario

mvn clean package wildfly:dev