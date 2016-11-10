FROM bsantanna/frontend-dev
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2016-10-25

RUN apt-get update -qq && apt-get install -y openssh-client

ENV SSH_DIR /opt/ssh
RUN mkdir ${SSH_DIR}
RUN ssh-keygen -t rsa -N "" -f ${SSH_DIR}/id_rsa
RUN cat ${SSH_DIR}/id_rsa.pub
RUN echo "   IdentityFile ${SSH_DIR}/id_rsa" >> /etc/ssh/ssh_config
RUN mkdir ~/.ssh/
RUN ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts

ENTRYPOINT ["/opt/frontend-dev/entrypoint.sh"]

