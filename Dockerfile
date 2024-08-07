FROM registry.access.redhat.com/ubi8/openjdk-21:1.19 as BUILDER

WORKDIR /app/

COPY build/*-runner /app/aplication

RUN chmod 775 /app

EXPOSE 8084

ENTRYPOINT ["./application", "-Dquarkus.http.host=0.0.0.0"]