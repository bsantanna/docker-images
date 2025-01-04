FROM bsantanna/java-python-dev:latest
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2025-01-04

RUN apt-get update -qq && \
    apt-get install -yqq --no-install-recommends pgcli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
