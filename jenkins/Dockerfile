FROM ubuntu:14.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2016-02-01

RUN apt-get update -qq && apt-get install -y curl openjdk-7-jdk git-core

ENV JENKINS_HOME /opt/jenkins/data
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

RUN mkdir -p $JENKINS_HOME/plugins
RUN curl -sf -o /opt/jenkins/jenkins.war -L $JENKINS_MIRROR/war-stable/latest/jenkins.war

RUN for plugin in chucknorris greenballs scm-api git-client git ws-cleanup ; do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi -L $JENKINS_MIRROR/plugins/${plugin}/latest/${plugin}.hpi ; done

ONBUILD ADD ./jenkins.sh /usr/local/bin/jenkins.sh
ONBUILD RUN chmod +x /usr/local/bin/jenkins.sh

VOLUME /var/lib/docker

EXPOSE 8080

ENV WORKSPACE_DIR /opt/jenkins-workspace
RUN mkdir ${WORKSPACE_DIR}
VOLUME ["${WORKSPACE_DIR}"]

RUN apt-get install -y openssh-client

ENV SSH_DIR /opt/ssh

RUN mkdir ${SSH_DIR}
RUN ssh-keygen -t rsa -N "" -f ${SSH_DIR}/id_rsa
RUN cat ${SSH_DIR}/id_rsa.pub
RUN echo "   IdentityFile ${SSH_DIR}/id_rsa" >> /etc/ssh/ssh_config
RUN mkdir ~/.ssh/
RUN ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts

ENTRYPOINT [ "/usr/local/bin/jenkins.sh" ]
