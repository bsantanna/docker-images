FROM bsantanna/base:latest
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2026-11-06

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -fsSL https://deb.nodesource.com/setup_26.x | bash - && \
    apt-get install -yqq --no-install-recommends nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
