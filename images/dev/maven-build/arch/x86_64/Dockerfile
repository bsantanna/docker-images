FROM bsantanna/base:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT 2024-12-29
ENV WORKSPACE_DIR /opt/workspace
ENV MAVEN_THREAD_COUNT 8

RUN apt-get update -qq && \
    apt-get install -yqq maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD config/settings.xml /etc/maven/settings.xml
ADD maven-entrypoint.sh /usr/local/bin/maven-entrypoint
RUN chmod +x /usr/local/bin/maven-entrypoint

RUN mkdir -p ${WORKSPACE_DIR}
WORKDIR ${WORKSPACE_DIR}
VOLUME ["${WORKSPACE_DIR}"]
ENTRYPOINT ["maven-entrypoint"]
