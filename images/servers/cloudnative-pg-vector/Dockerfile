ARG PG_VERSION=17.11

FROM ghcr.io/cloudnative-pg/postgresql:${PG_VERSION}-minimal-bookworm
ENV REFRESHED_AT=2026-11-06

USER 0

RUN set -xe; \
    apt-get update -qq; \
    apt-get install -yqq --no-install-recommends \
        "postgresql-17-pgvector" ; \
    rm -fr /tmp/* ; \
    rm -rf /var/lib/apt/lists/* /var/tmp/*;

USER 26
