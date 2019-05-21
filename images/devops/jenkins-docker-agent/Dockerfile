FROM bsantanna/maven-build
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2018-08-20
ENV DEBIAN_FRONTEND noninteractive
ENV JENKINS_HOME /opt/jenkins/data
ENV WORKSPACE_DIR /opt/jenkins/data/workspace

VOLUME /var/lib/docker

RUN curl -sSL get.docker.com | sh

RUN apt-get update -qq && \
    apt-get install -yqq docker-compose && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ONBUILD ADD ./jenkins-agent.sh /usr/local/bin/jenkins-agent
ONBUILD RUN chmod +x /usr/local/bin/jenkins-agent
ADD jenkins.sh /usr/local/bin/jenkins
RUN chmod +x /usr/local/bin/jenkins

ARG VERSION=3.20

RUN curl --create-dirs -sSLo /usr/share/jenkins/agent.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/agent.jar

RUN mkdir -p ${JENKINS_HOME}

VOLUME ["${WORKSPACE_DIR}"]
WORKDIR ${JENKINS_HOME}

ENTRYPOINT [ "/usr/local/bin/jenkins" ]
