FROM bsantanna/base:latest
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2024-12-29

RUN apt update -q && \
    apt install -yqq samba expect rpcbind && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD scripts /scripts
ONBUILD ADD config/ /config
ONBUILD RUN mv /config/smb.conf /etc/samba/smb.conf
ONBUILD RUN bash /scripts/provision/useradd_batch.sh
ONBUILD RUN bash /scripts/provision/groupadd_batch.sh
ONBUILD RUN bash /scripts/provision/passwd_batch.sh
ONBUILD RUN bash /scripts/provision/smbpasswd_batch.sh

CMD ["/bin/bash", "/scripts/runtime/service_exec.sh"]

EXPOSE 138/udp
EXPOSE 139
EXPOSE 445
EXPOSE 445/udp
