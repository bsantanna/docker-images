FROM bsantanna/java-dev
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2018-12-30
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
    apt-get install -yqq python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

