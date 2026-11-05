FROM bsantanna/base:latest
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2026-11-05


RUN apt-get update -qq && \
    apt-get install -qqy --no-install-recommends ruby-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

