# Etapa de construção
FROM openjdk:21-jdk-alpine as build
WORKDIR /build
COPY . .
RUN ./mvnw package

# Etapa final
FROM registry.access.redhat.com/ubi8/ubi-minimal:8.9
WORKDIR /app
RUN chown 1001 /app \
    && chmod "g+rwX" /app \
    && chown 1001:root /app
COPY --from=build /build/quarkus-app/app /app/

EXPOSE 8084
USER 1001

ENTRYPOINT ["./application", "-Dquarkus.http.host=0.0.0.0"]