FROM bsantanna/ubuntu:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT 2022-06-05

ENV SQUID_CACHE_DIR=/var/spool/squid3 \
    SQUID_LOG_DIR=/var/log/squid3 \
    SQUID_USER=proxy

RUN apt-get update -q && \
    apt-get install -yqq --no-install-recommends ca-certificates squid  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ONBUILD ADD config/squid.conf /etc/squid3/squid.conf

ADD entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 3128/tcp
VOLUME ["${SQUID_CACHE_DIR}"]
CMD ["/sbin/entrypoint.sh"]
