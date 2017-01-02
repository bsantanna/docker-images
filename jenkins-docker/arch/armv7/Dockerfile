FROM armhf/debian
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2017-01-01

RUN apt-get update -qq

# Java install
RUN apt-get install -yqq ca-certificates openjdk-7-jdk

# Build tools install
RUN apt-get install -yqq curl git git-svn subversion

# Jenkins install
ENV JENKINS_HOME /opt/jenkins/data
RUN mkdir -p $JENKINS_HOME/plugins
RUN curl -sf -o /opt/jenkins/jenkins.war -L http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war
RUN for plugin in scm-api git-client git ws-cleanup blueocean ant subversion structs workflow-step-api workflow-scm-step maven-plugin mailer ; do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi -L http://mirrors.jenkins-ci.org/plugins/${plugin}/latest/${plugin}.hpi ; done
ENV WORKSPACE_DIR /opt/jenkins/data/workspace
VOLUME ["${WORKSPACE_DIR}"]

# Docker install
VOLUME /var/lib/docker
RUN curl -sSL get.docker.com | sh

# Entrypoint
EXPOSE 8080
ADD ./jenkins.sh /usr/local/bin/jenkins.sh
RUN chmod +x /usr/local/bin/jenkins.sh
ENTRYPOINT ["bash", "/usr/local/bin/jenkins.sh" ]