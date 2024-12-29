FROM bsantanna/ubuntu:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT 2022-06-03

RUN apt-get update -qq && \
    apt-get install -yqq ddclient && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ONBUILD ADD config/ddclient.conf /etc/ddclient.conf

ADD entrypoint.sh /bin/entrypoint
RUN chmod +x /bin/entrypoint

ENTRYPOINT ["bash", "/bin/entrypoint"]
