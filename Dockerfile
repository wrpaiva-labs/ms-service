# Usando a imagem do OpenJDK 21
FROM registry.access.redhat.com/ubi8/ubi-minimal:8.9
WORKDIR /app
RUN chown 1001 /app \
    && chmod "g+rwX" /app \
    && chown 1001:root /app

# Corrigindo: Adicione o destino para o COPY
COPY --from=build /quarkus-app/app /app/

EXPOSE 8084
USER 1001

ENTRYPOINT ["./application", "-Dquarkus.http.host=0.0.0.0"]