FROM ubuntu:14.04
MAINTAINER Bruno Sant'Anna "mail@bsantanna.me"
ENV REFRESHED_AT 2015-06-02

RUN apt-get update -qq && apt-get install -qqy samba expect
RUN groupadd embraco
ADD scripts /scripts
ONBUILD ADD config/ /config
ONBUILD RUN mv /config/smb.conf /etc/samba/smb.conf
ONBUILD RUN bash /scripts/provision/useradd_batch.sh
ONBUILD RUN bash /scripts/provision/passwd_batch.sh
ONBUILD RUN bash /scripts/provision/smbpasswd_batch.sh
ENTRYPOINT ["/usr/sbin/smbd", "--foreground"]

EXPOSE 139
EXPOSE 445
EXPOSE 137/udp
EXPOSE 138/udp
