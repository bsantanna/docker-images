FROM ghcr.io/cloudnative-pg/postgresql:17.4

USER root

RUN set -xe; \
    apt update; \
    apt install -y --no-install-recommends \
        "postgresql-17-pgvector" ; \
    rm -fr /tmp/* ; \
    rm -rf /var/lib/apt/lists/*;