FROM bsantanna/maven-build:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2024-12-29


RUN apt-get update -qq && \
    apt-get install -qqy ruby-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

