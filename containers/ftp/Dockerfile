FROM bsantanna/ubuntu-multi:16.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2017-05-10

RUN apt-get update -qq && apt-get install -qqy vsftpd

ADD scripts/ /scripts
ONBUILD ADD config/ /config
ONBUILD RUN mv /config/vsftpd.conf /etc/vsftpd.conf
ONBUILD RUN bash /scripts/provision/useradd_batch.sh
ONBUILD RUN bash /scripts/provision/passwd_batch.sh

EXPOSE 20 21 4559 4560 4561 4562 4563 4564

CMD ["/bin/bash", "/scripts/runtime/service_exec.sh"]