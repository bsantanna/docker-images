FROM bsantanna/ubuntu-multi:16.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2017-11-09

ENV SQUID_CACHE_DIR=/var/spool/squid3 \
    SQUID_LOG_DIR=/var/log/squid3 \
    SQUID_USER=proxy

RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq && \
    apt-get install -qqy --no-install-recommends ca-certificates squid  && \
    apt-get clean

ONBUILD ADD config/squid.conf /etc/squid3/squid.conf

ADD entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 3128/tcp
VOLUME ["${SQUID_CACHE_DIR}"]
ENTRYPOINT ["/sbin/entrypoint.sh"]