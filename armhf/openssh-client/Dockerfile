FROM armhf/ubuntu:16.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2016-12-28
ENV SSH_DIR /opt/ssh

RUN apt-get update -qq && apt-get install -yqq openssh-client
RUN mkdir ${SSH_DIR}
RUN ssh-keygen -t rsa -N "" -f ${SSH_DIR}/id_rsa
RUN cat ${SSH_DIR}/id_rsa.pub
RUN echo "   IdentityFile ${SSH_DIR}/id_rsa" >> /etc/ssh/ssh_config
RUN mkdir ~/.ssh/
RUN ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts
RUN ssh-keyscan github.org >> ~/.ssh/known_hosts