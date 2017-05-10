FROM bsantanna/ubuntu-multi:16.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2017-05-10

RUN apt-get update -qq && apt-get install -qqy vsftpd

ADD scripts/ /scripts
ONBUILD ADD config/ /config
ONBUILD RUN mv /config/vsftpd.conf /etc/vsftpd.conf

EXPOSE 21

CMD ["/bin/bash", "/scripts/runtime/service_exec.sh"]