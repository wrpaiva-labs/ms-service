# Usando a imagem do OpenJDK 21
FROM registry.access.redhat.com/ubi8/ubi-minimal:8.9
WORKDIR /work/
RUN chown 1001 /work \
    && chmod "g+rwX" /work \
    && chown 1001:root /work
COPY --chown=1001:root build/*-runner /work/application

EXPOSE 8084
USER 1001

ENTRYPOINT ["./application", "-Dquarkus.http.host=0.0.0.0"]