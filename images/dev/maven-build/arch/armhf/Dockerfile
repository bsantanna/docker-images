FROM bsantanna/alpine:armhf
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2018-05-12
#ENV REFRESHED_AT 2018-08-18
#ENV REFRESHED_AT 2019-07-179
ENV REFRESHED_AT 2020-09-20

ENV WORKSPACE_DIR /opt/workspace
ENV MAVEN_THREAD_COUNT 4

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories; \
    echo "http://uk.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories; \
    echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "@community http://uk.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk --update --no-cache add maven

ADD config/settings.xml /etc/maven/settings.xml
ADD maven-entrypoint.sh /usr/local/bin/maven-entrypoint
RUN chmod +x /usr/local/bin/maven-entrypoint

RUN mkdir -p ${WORKSPACE_DIR}
WORKDIR ${WORKSPACE_DIR}
VOLUME ["${WORKSPACE_DIR}"]
ENTRYPOINT ["maven-entrypoint"]
