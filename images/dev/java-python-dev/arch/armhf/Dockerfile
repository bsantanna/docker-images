FROM bsantanna/ubuntu:armhf
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT 2022-06-03

RUN apt-get update -qq && \
    apt-get install -yqq ca-certificates python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD exec-entrypoint.sh /usr/local/bin/exec-entrypoint
RUN chmod +x /usr/local/bin/exec-entrypoint

CMD ["exec-entrypoint"]
