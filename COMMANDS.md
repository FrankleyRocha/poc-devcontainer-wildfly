# START DB
```bash
docker run -d -e POSTGRES_PASSWORD=minha_senha -e POSTGRES_USER=meu_usuario -e POSTGRES_DB=meu_banco -p 5432:5432 --name postgres postgres
```

# START DEV
```bash
export POSTGRESQL_DATABASE=meu_banco
export POSTGRESQL_PASSWORD=minha_senha
export POSTGRESQL_USER=meu_usuario


mvn clean package wildfly:dev
```

# DROP DB
```bash
docker rm postgres -fv
```