FROM jenkins/jnlp-slave
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2018-06-04

VOLUME /var/lib/docker

RUN apt-get update -q && apt-get install -yqq docker.io

ADD ./jenkins.sh /usr/local/bin/jenkins.sh
RUN chmod +x /usr/local/bin/jenkins.sh

ENTRYPOINT [ "/usr/local/bin/jenkins.sh" ]

