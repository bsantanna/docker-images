FROM bsantanna/ubuntu:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV CREATED_AT 2017-10-26
ENV REFRESHED_AT 2018-08-19
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
    apt-get install -yqq ca-certificates ddclient && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ONBUILD ADD config/ddclient.conf /etc/ddclient.conf

ADD entrypoint.sh /bin/entrypoint
RUN chmod +x /bin/entrypoint

ENTRYPOINT ["bash", "/bin/entrypoint"]
