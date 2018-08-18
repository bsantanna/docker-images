FROM bsantanna/openjdk-8-jdk
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2017-01-10
ENV REFRESHED_AT 2018-05-12
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get install -yqq curl git git-svn subversion maven

ENV JENKINS_HOME /opt/jenkins/data

RUN mkdir -p $JENKINS_HOME/plugins
RUN curl -sf -o /opt/jenkins/jenkins.war -L http://mirrors.jenkins.io/war-stable/latest/jenkins.war

RUN for plugin in ws-cleanup scm-api git-client git subversion ; do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi -L http://mirrors.jenkins.io/plugins/${plugin}/latest/${plugin}.hpi ; done

ADD ./jenkins.sh /usr/local/bin/jenkins.sh
RUN chmod +x /usr/local/bin/jenkins.sh

EXPOSE 8080
EXPOSE 8081

ENV WORKSPACE_DIR /opt/jenkins/data/workspace
VOLUME ["${WORKSPACE_DIR}"]

ENTRYPOINT [ "/usr/local/bin/jenkins.sh" ]
