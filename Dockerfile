# Usando a imagem do OpenJDK 21
FROM eclipse-temurin:21-jdk-alpine as build
WORKDIR /app

# Copiar o código fonte e compilar
COPY . /app

RUN chown 1001 /app \
    && chmod "g+rwX" /app \
    && chown 1001:root /app
COPY --chown=1001:root build/*-runner /app/application

EXPOSE 8084
USER 1001

ENTRYPOINT ["./application", "-Dquarkus.http.host=0.0.0.0"]