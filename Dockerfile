# Etapa 1: imagem com Gradle para build
FROM gradle:8.4-jdk17-alpine AS builder

# Copia os arquivos do projeto
COPY . /app
WORKDIR /app

# Compila o projeto e gera o .jar
RUN gradle clean build --no-daemon

# Etapa 2: imagem final apenas com o JAR
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copia o JAR gerado da imagem anterior
COPY --from=builder /app/build/libs/*.jar app.jar

# Expõe a porta
EXPOSE 8080

# Comando de inicialização
ENTRYPOINT ["java", "-jar", "app.jar"]
