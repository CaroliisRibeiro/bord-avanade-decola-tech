# Usa uma imagem base com Java 17
FROM eclipse-temurin:17-jdk-alpine

# Cria diretório da aplicação
WORKDIR /app

# Copia o JAR gerado para dentro do container
COPY build/libs/*.jar app.jar

# Porta que o Spring Boot expõe
EXPOSE 8080

# Comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
