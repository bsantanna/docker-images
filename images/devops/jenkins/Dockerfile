FROM bsantanna/alpine
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2017-01-10
#ENV REFRESHED_AT 2018-05-12
#ENV REFRESHED_AT 2018-08-19
#ENV REFRESHED_AT 2018-08-27
ENV REFRESHED_AT 2019-06-13
ENV JENKINS_HOME /opt/jenkins/data
ENV WORKSPACE_DIR /opt/jenkins/data/workspace
ENV JAVA_OPTS "-Dorg.jenkinsci.plugins.durabletask.BourneShellScript.HEARTBEAT_CHECK_INTERVAL=300"

RUN apk --update add --no-cache --virtual wget && \
    apk --update add --no-cache --virtual bash

RUN mkdir -p ${JENKINS_HOME}/plugins
RUN set -eux; \
    wget  -O /opt/jenkins/jenkins.war -L http://mirrors.jenkins.io/war-stable/latest/jenkins.war

ADD plugins.txt /opt/jenkins/plugins.txt
RUN set -eux; \
    for plugin in $(cat /opt/jenkins/plugins.txt) ; do wget  -O ${JENKINS_HOME}/plugins/${plugin}.hpi -L http://mirrors.jenkins.io/plugins/${plugin}/latest/${plugin}.hpi ; done

EXPOSE 8080
EXPOSE 8081

VOLUME ["${WORKSPACE_DIR}"]
ADD jenkins-entrypoint.sh /usr/local/bin/jenkins-entrypoint
RUN chmod +x /usr/local/bin/jenkins-entrypoint

ENTRYPOINT [ "jenkins-entrypoint" ]
