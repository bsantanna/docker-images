FROM bsantanna/openjdk-8-jdk
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2016-12-16

RUN apt-get update -qq && apt-get install -yqq curl git-core

ENV JENKINS_HOME /opt/jenkins/data

RUN mkdir -p $JENKINS_HOME/plugins
RUN curl -sf -o /opt/jenkins/jenkins.war -L http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war

RUN for plugin in chucknorris greenballs scm-api git-client git ws-cleanup ; do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi -L http://mirrors.jenkins-ci.org/plugins/${plugin}/latest/${plugin}.hpi ; done

ONBUILD ADD ./jenkins.sh /usr/local/bin/jenkins.sh
ONBUILD RUN chmod +x /usr/local/bin/jenkins.sh

VOLUME /var/lib/docker

EXPOSE 8080

ENV WORKSPACE_DIR /opt/jenkins-workspace
RUN mkdir ${WORKSPACE_DIR}
VOLUME ["${WORKSPACE_DIR}"]

ENTRYPOINT [ "/usr/local/bin/jenkins.sh" ]
