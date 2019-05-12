FROM bsantanna/ubuntu
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2017-04-18
ENV REFRESHED_AT 2018-08-19
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && \
    apt-get install -qqy netbase nfs-kernel-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD scripts /scripts
ONBUILD ADD config/ /config
ONBUILD RUN mv /config/exports /etc/exports

EXPOSE 111 111/udp 2049 2049/udp

CMD ["/bin/bash", "/scripts/runtime/service_exec.sh"]