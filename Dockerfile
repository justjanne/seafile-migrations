FROM liquibase:4.33-alpine

COPY migrations /migrations
COPY docker/liquibase.properties /migrations
COPY docker/entrypoint.sh /entrypoint.sh

WORKDIR /migrations

USER 1000:1000

ENTRYPOINT ["/entrypoint.sh"]
