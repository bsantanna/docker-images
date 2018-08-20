FROM bsantanna/jenkins-docker-agent
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2018-08-20
ENV DEBIAN_FRONTEND noninteractive

# Based on https://github.com/rastasheep/ubuntu-sshd

RUN apt-get update -q && \
    apt-get install -yqq openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/run/sshd

RUN echo "root:root" |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh || true

EXPOSE 22