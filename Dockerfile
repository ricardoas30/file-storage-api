FROM openjdk:17.0.2-jdk
WORKDIR /app
COPY target/file-storage-api-0.0.2-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]

## docker run -p 8081:8081 nome-do-repositorio:latest