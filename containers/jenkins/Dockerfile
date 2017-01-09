FROM bsantanna/openjdk-8-jdk
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2017-01-09

RUN apt-get update -qq && apt-get install -yqq curl git git-svn subversion

ENV JENKINS_HOME /opt/jenkins/data

RUN mkdir -p $JENKINS_HOME/plugins
RUN curl -sf -o /opt/jenkins/jenkins.war -L http://mirrors.jenkins.io/war-stable/latest/jenkins.war

RUN for plugin in scm-api git-client git ws-cleanup blueocean blueocean-i18n blueocean-display-url blueocean-rest blueocean-pipeline-api-impl blueocean-autofavorite blueocean-dashboard blueocean-rest-impl blueocean-web blueocean-commons blueocean-jwt blueocean-personalization blueocean-config ant subversion structs workflow-step-api workflow-scm-step pipeline-model-definition maven-plugin mailer ; do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi -L http://mirrors.jenkins.io/plugins/${plugin}/latest/${plugin}.hpi ; done

ONBUILD ADD ./jenkins.sh /usr/local/bin/jenkins.sh
ONBUILD RUN chmod +x /usr/local/bin/jenkins.sh

EXPOSE 8080

ENV WORKSPACE_DIR /opt/jenkins/data/workspace
VOLUME ["${WORKSPACE_DIR}"]

ENTRYPOINT [ "/usr/local/bin/jenkins.sh" ]
