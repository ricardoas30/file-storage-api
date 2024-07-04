
# Storage API

Uma API de Upload e Download de arquivos, utilizando Java Spring Boot.


## Stack utilizada

**Back-end:** Spring Boot 3.3.1, OpenJDK 17, Dependência (Spring Web).


## Documentação da API

#### Retorna uma lista de arquivos

```http
  GET /api/files/list
```

#### Download de um arquivo específico

```http
  GET /api/files/download/your-file-name.txt
```

#### Upload do arquivo

```http
  POST /api/files/upload
```

| Parâmetro   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `fileName`      | `multipart` | **Obrigatório**. Arquivo a ser enviado (foto.png) |

## Deploy

Para fazer o deploy desse projeto rode

```bash
  ./mvnw clean package
```
Executar

```bash
  java -jar ./target/file-storage-api.jar
```