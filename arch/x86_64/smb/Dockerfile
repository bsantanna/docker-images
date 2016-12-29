FROM ubuntu:14.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2015-06-04

RUN apt-get update -qq && apt-get install -qqy samba expect rpcbind
RUN groupadd embraco
ADD scripts /scripts
ONBUILD ADD config/ /config
ONBUILD RUN mv /config/smb.conf /etc/samba/smb.conf
ONBUILD RUN bash /scripts/provision/useradd_batch.sh
ONBUILD RUN bash /scripts/provision/passwd_batch.sh
ONBUILD RUN bash /scripts/provision/smbpasswd_batch.sh

CMD ["/bin/bash", "/scripts/runtime/service_exec.sh"]

EXPOSE 138/udp
EXPOSE 139
EXPOSE 445
EXPOSE 445/udp
