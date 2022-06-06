FROM bsantanna/ubuntu:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV CREATED_AT 2018-08-19
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && \
    apt-get install -yqq  --no-install-recommends \
      build-essential git golang-1.16 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD manifest-tool-installer.sh /opt/docker-manifest-publisher/manifest-tool-installer.sh
RUN chmod +x /opt/docker-manifest-publisher/manifest-tool-installer.sh && \
    /opt/docker-manifest-publisher/manifest-tool-installer.sh

ADD manifest-publish.sh /opt/docker-manifest-publisher/manifest-publish.sh
RUN chmod +x /opt/docker-manifest-publisher/manifest-publish.sh

ENTRYPOINT ["/opt/docker-manifest-publisher/manifest-publish.sh"]
