FROM bsantanna/maven-build
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2017-01-10
#ENV REFRESHED_AT 2018-05-12
#ENV REFRESHED_AT 2018-08-19
ENV REFRESHED_AT 2018-08-27
ENV DEBIAN_FRONTEND noninteractive
ENV JENKINS_HOME /opt/jenkins/data
ENV WORKSPACE_DIR /opt/jenkins/data/workspace

RUN mkdir -p ${JENKINS_HOME}/plugins
RUN curl -sf -o /opt/jenkins/jenkins.war -L http://mirrors.jenkins.io/war-stable/latest/jenkins.war

ADD plugins.txt /opt/jenkins/plugins.txt
RUN for plugin in $(cat /opt/jenkins/plugins.txt) ; do curl -sf -o ${JENKINS_HOME}/plugins/${plugin}.hpi -L http://mirrors.jenkins.io/plugins/${plugin}/latest/${plugin}.hpi ; done

ADD jenkins.sh /usr/local/bin/jenkins.sh
RUN chmod +x /usr/local/bin/jenkins.sh

EXPOSE 8080
EXPOSE 8081

VOLUME ["${WORKSPACE_DIR}"]

ENTRYPOINT [ "/usr/local/bin/jenkins.sh" ]
