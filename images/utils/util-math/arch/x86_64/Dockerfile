FROM bsantanna/java-python-dev:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT 2022-06-03

RUN apt-get update -qq && \
    apt-get install -yqq ca-certificates python3-numpy python3-scipy python3-pandas python3-matplotlib python3-sympy && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
