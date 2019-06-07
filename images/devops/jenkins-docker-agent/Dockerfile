FROM bsantanna/alpine-x86_64
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2018-08-20
ENV REFRESHED_AT 2019-06-07
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV JENKINS_HOME /opt/jenkins/data
ENV WORKSPACE_DIR /opt/jenkins/data/workspace
ENV DISTRIBUTION_URL "https://secure.btech.software/repo/jdk/11/openjdk-11-linux-amd64.tar.gz"

VOLUME /var/lib/docker

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update add --no-cache --virtual build-deps curl docker docker-compose

RUN mkdir -p ${JAVA_HOME}
RUN curl -o /tmp/pkg.tar.gz ${DISTRIBUTION_URL} && \
    cd /tmp && tar -zxf pkg.tar.gz && mv $(ls . | grep jdk)/* ${JAVA_HOME} && \
    rm -fr /tmp/pkg* && rm -fr /tmp/jdk*

ONBUILD ADD ./jenkins-agent.sh /usr/local/bin/jenkins-agent
ONBUILD RUN chmod +x /usr/local/bin/jenkins-agent
ADD jenkins.sh /usr/local/bin/jenkins
RUN chmod +x /usr/local/bin/jenkins

ARG VERSION=3.30

RUN curl --create-dirs -sSLo /usr/share/jenkins/agent.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/agent.jar

RUN mkdir -p ${JENKINS_HOME}

VOLUME ["${WORKSPACE_DIR}"]
WORKDIR ${JENKINS_HOME}

ENTRYPOINT [ "/usr/local/bin/jenkins" ]
