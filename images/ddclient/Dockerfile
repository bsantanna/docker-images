FROM bsantanna/ubuntu-multi:16.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2017-10-26
ENV REFRESHED_AT 2018-08-19
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
    apt-get install -yqq ca-certificates ddclient && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ONBUILD ADD config/ddclient.conf /etc/ddclient.conf

ADD entrypoint.sh /sbin/entrypoint
RUN chmod +x /sbin/entrypoint

ENTRYPOINT ["/sbin/entrypoint"]
