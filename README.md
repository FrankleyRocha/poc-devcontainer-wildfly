O **`wildfly:deploy`** pertence ao **WildFly Maven Plugin**, que é utilizado para implantar aplicações Java EE/Jakarta EE diretamente em servidores **WildFly** ou **JBoss EAP**.  

Por padrão, o JBoss EAP não vem com esse plugin configurado no `pom.xml`, então, se quiser utilizá-lo, você precisa adicioná-lo.

---

## 🔹 **1. Adicionar o Plugin WildFly no `pom.xml`**
Se o seu projeto não tem esse plugin, adicione-o na seção `<plugins>` do seu `pom.xml`:

```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.wildfly.plugins</groupId>
            <artifactId>wildfly-maven-plugin</artifactId>
            <version>4.0.0.Final</version>
        </plugin>
    </plugins>
</build>
```

Isso permite que você use comandos Maven para gerenciar a implantação no JBoss EAP.

---

## 🔹 **2. Configurar o Servidor JBoss EAP**
Antes de rodar o comando, certifique-se de que:
- O **JBoss EAP** está rodando.
- O **modo de gerenciamento remoto** está habilitado.  

Por padrão, o **JBoss EAP** aceita deploys via **CLI Management Interface** na porta **9990**.

Se precisar alterar, edite o arquivo `standalone.xml` e configure a interface de gerenciamento.

---

## 🔹 **3. Implantar a Aplicação no JBoss EAP**
Agora, você pode rodar:

```sh
mvn wildfly:deploy
```

Isso faz o deploy automático da aplicação no servidor JBoss.

Se precisar remover e fazer um novo deploy, use:

```sh
mvn wildfly:redeploy
```

Para desfazer a implantação:

```sh
mvn wildfly:undeploy
```

---

## 🔹 **4. Configurar Usuário de Administração (Se Necessário)**
Se o deploy falhar por falta de credenciais, você precisa adicionar um usuário no **JBoss CLI**:

```sh
add-user.sh -a -u admin -p admin
```

Depois, no `pom.xml`, adicione a configuração para conectar no JBoss:

```xml
<configuration>
    <hostname>localhost</hostname>
    <port>9990</port>
    <username>admin</username>
    <password>admin</password>
    <filename>seu-arquivo.war</filename>
</configuration>
```

Agora, o comando `mvn wildfly:deploy` vai se conectar automaticamente no JBoss EAP.

---

## 🔹 **5. Depuração no VS Code**
Se quiser depurar enquanto faz o deploy, siga os passos:
1. **Inicie o JBoss no modo debug**:
   ```sh
   standalone.sh --debug 8787
   ```
2. **Execute o deploy com Maven**:
   ```sh
   mvn clean package wildfly:deploy
   ```
3. **Anexe o depurador no VS Code** (`Ctrl + Shift + D`) usando a configuração:

   ```json
   {
       "type": "java",
       "request": "attach",
       "name": "Attach to JBoss EAP",
       "hostName": "localhost",
       "port": 8787
   }
   ```

Agora, você pode colocar breakpoints e depurar diretamente no **VS Code**!

---

## ✅ **Conclusão**
- O **WildFly Maven Plugin** permite implantar aplicações diretamente no **JBoss EAP** via `mvn wildfly:deploy`.
- Se precisar de autenticação, adicione um usuário no JBoss e configure o `pom.xml`.
- Para depurar, **rode o JBoss no modo debug** e **anexe o depurador no VS Code**.

Com isso, você pode desenvolver e depurar aplicações **Java EE/Jakarta EE** no **JBoss EAP** usando **Maven e VS Code**! 🚀