FROM bsantanna/openjdk-8-jdk
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2018-06-07
ENV REFRESHED_AT 2018-08-19
ENV DEBIAN_FRONTEND noninteractive
ENV JENKINS_HOME /opt/jenkins/data
ENV WORKSPACE_DIR /opt/jenkins/data/workspace

VOLUME /var/lib/docker

RUN apt-get update -q && \
    apt-get install -yqq curl git git-svn subversion maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sSL get.docker.com | sh

ADD ./jenkins-slave.sh /usr/local/bin/jenkins-slave
RUN chmod +x /usr/local/bin/jenkins-slave
ADD ./jenkins.sh /usr/local/bin/jenkins
RUN chmod +x /usr/local/bin/jenkins

ARG VERSION=3.20

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar

RUN mkdir -p ${JENKINS_HOME}

VOLUME ["${WORKSPACE_DIR}"]
WORKDIR ${JENKINS_HOME}

ENTRYPOINT [ "/usr/local/bin/jenkins" ]
