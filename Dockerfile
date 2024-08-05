# Usando a imagem do OpenJDK 21
FROM eclipse-temurin:21-jdk-alpine as build
WORKDIR /app

# Copiar o código fonte e compilar
COPY . /app
RUN ./gradlew build -Dquarkus.native.enabled=true

# Usando a imagem do OpenJDK 21 JRE
#FROM eclipse-temurin:21-jre-alpine
#WORKDIR /app
## Copiar o arquivo compilado
#COPY --from=build /app/target/ms-service-app/ms-service.jar /app/ms-service.jar
#

COPY --from=build /ms-service.jar /app/ms-service.jar

EXPOSE 8084
CMD ["java", "-jar", "/app/ms-service.jar"]