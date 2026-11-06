FROM ghcr.io/cloudnative-pg/postgresql:17.11-minimal-bookworm
ENV REFRESHED_AT=2026-11-06

USER root

RUN set -xe; \
    apt update; \
    apt install -y --no-install-recommends \
        "postgresql-17-pgvector" ; \
    rm -fr /tmp/* ; \
    rm -rf /var/lib/apt/lists/*;
