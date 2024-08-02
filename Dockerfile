# Usando a imagem do OpenJDK 21
FROM openjdk:21-jdk-alpine as build
WORKDIR /app

# Copiar o código fonte e compilar
COPY . /app
RUN ./mvnw package -DskipTests

# Usando a imagem do OpenJDK 21 JRE
FROM openjdk:21-jre-alpine
WORKDIR /app

COPY --from=build /app/target/ms-service-app/ms-service.jar /app/ms-service.jar
EXPOSE 8081
CMD ["java", "-jar", "/app/ms-service.jar"]