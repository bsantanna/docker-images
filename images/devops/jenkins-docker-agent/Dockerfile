FROM bsantanna/alpine:x86_64
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2018-08-20
ENV REFRESHED_AT 2019-06-07
ENV JENKINS_HOME /opt/jenkins/data
ENV JENKINS_AGENT_VERSION 3.30
ENV WORKSPACE_DIR /opt/jenkins/data/workspace

RUN apk --update add --no-cache --virtual \
    build-deps bash curl docker gcc git libffi-dev libc-dev make openssl-dev openssh-client \
    py-pip python-dev

RUN pip install docker-compose

ADD jenkins.sh /usr/local/bin/jenkins
ADD jenkins-agent.sh /usr/local/bin/jenkins-agent
RUN chmod +x /usr/local/bin/jenkins
RUN chmod +x /usr/local/bin/jenkins-agent

RUN curl --create-dirs -sSLo /usr/share/jenkins/agent.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${JENKINS_AGENT_VERSION}/remoting-${JENKINS_AGENT_VERSION}.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/agent.jar

RUN mkdir -p ${JENKINS_HOME}

VOLUME ["${WORKSPACE_DIR}"]
WORKDIR ${JENKINS_HOME}

ENTRYPOINT [ "/usr/local/bin/jenkins" ]
