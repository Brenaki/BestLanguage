# Dockerfile para API Java (Spring Boot)
FROM openjdk:17-jdk-slim AS builder

WORKDIR /app

# Copiar arquivos de dependências
COPY pom.xml .

# Baixar dependências (cache layer)
RUN mvn dependency:go-offline -B

# Copiar código fonte
COPY src ./src

# Compilar a aplicação
RUN mvn clean package -DskipTests

# Imagem final
FROM openjdk:17-jre-slim

WORKDIR /app

# Copiar o JAR compilado
COPY --from=builder /app/target/*.jar app.jar

# Expor porta
EXPOSE 3000

# Comando para executar
CMD ["java", "-jar", "app.jar", "--server.port=3000"]
