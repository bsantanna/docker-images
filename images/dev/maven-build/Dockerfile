FROM bsantanna/base:latest
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2024-12-29
ENV WORKSPACE_DIR=/opt/workspace
ENV MAVEN_THREAD_COUNT=8

RUN apt update -qq && \
    apt install -yqq --no-install-recommends maven && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD config/settings.xml /etc/maven/settings.xml
ADD maven-entrypoint.sh /usr/local/bin/maven-entrypoint
RUN chmod +x /usr/local/bin/maven-entrypoint

RUN mkdir -p ${WORKSPACE_DIR}
WORKDIR ${WORKSPACE_DIR}
VOLUME ["${WORKSPACE_DIR}"]
CMD ["maven-entrypoint"]
