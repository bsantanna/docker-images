FROM bsantanna/alpine
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2018-05-12
#ENV REFRESHED_AT 2018-08-18
# ENV REFRESHED_AT 2019-07-17
ENV REFRESHED_AT 2020-02-28
ENV WORKSPACE_DIR /opt/workspace

RUN apk --update add bash
RUN apk --update add maven

ADD config/settings.xml /etc/maven/settings.xml
ADD maven-entrypoint.sh /usr/local/bin/maven-entrypoint
RUN chmod +x /usr/local/bin/maven-entrypoint

RUN mkdir -p ${WORKSPACE_DIR}
WORKDIR ${WORKSPACE_DIR}
VOLUME ["${WORKSPACE_DIR}"]
ENTRYPOINT ["maven-entrypoint"]
