
# Storage API

Uma API de Upload e Download de arquivos, utilizando Java Spring Boot.


## Stack utilizada

**Back-end:** Spring Boot 3.3.1, OpenJDK 17, Dependência (Spring Web).


## Documentação da API

#### Retorna uma lista de arquivos

```
  GET /api/files/list
```

#### Download de um arquivo específico

```
  GET /api/files/download/your-file-name.txt
```

#### Upload do arquivo

```
  POST /api/files/upload
```

| Parâmetro   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `fileName`      | `multipart/form-data` | **Obrigatório**. Arquivo a ser enviado (foto.png) |


#### Deletar um arquivo

```
  POST /api/files/delete
```

| Parâmetro   | Tipo       | Descrição                                          |
| :---------- | :--------- |:---------------------------------------------------|
| `fileName`      | `multipart/form-data` | **Obrigatório**. Arquivo a ser deletado (foto.png) |

## Deploy Docker

1.Certifique-se de que você tenha o Docker instalado em sua máquina. Você pode baixar e instalar o Docker a partir do site oficial: https://www.docker.com/products/docker-desktop

2.Adicione o plugin Dockerfile Maven ao seu arquivo pom.xml para criar a imagem Docker do seu aplicativo Spring Boot. Aqui está um exemplo de como você pode configurar o plugin no pom.xml:

```bash
  <build>
    <plugins>
        <plugin>
            <groupId>com.spotify</groupId>
            <artifactId>dockerfile-maven-plugin</artifactId>
            <version>1.4.10</version>
            <executions>
                <execution>
                    <id>build-image</id>
                    <phase>package</phase>
                    <goals>
                        <goal>build</goal>
                    </goals>
                </execution>
            </executions>
            <configuration>
                <repository>nome-do-repositorio</repository>
            </configuration>
        </plugin>
    </plugins>
</build>
```

3.Criar um arquivo Dockerfile na raiz do seu projeto Spring Boot para definir como a imagem do contêiner Docker será construída. Aqui está um exemplo de um Dockerfile básico:


```bash
FROM openjdk:17.0.2-jdk
WORKDIR /app
COPY target/sua-aplicacao.jar app.jar
CMD ["java", "-jar", "app.jar"]
```

4.Certifique-se de substituir "sua-aplicacao.jar" pelo nome do arquivo JAR gerado após a build do seu projeto Spring Boot. Execute o comando Maven para construir a imagem Docker da sua aplicação com o plugin Dockerfile Maven:

```bash
mvn clean package
```

5.Por fim, execute o contêiner Docker localmente com o comando abaixo, substituindo "nome-da-imagem" pelo nome da imagem que você definiu no plugin Dockerfile Maven:

```bash
docker run -p 8080:8080 nome-da-imagem
```

Pronto, agora sua aplicação Spring Boot deve estar sendo executada em um contêiner Docker localmente. Você pode acessá-la em http://localhost:8080.