FROM debian:bookworm-slim
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2026-11-06
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
    apt-get install -yqq --no-install-recommends \
        samba expect rpcbind init-system-helpers passwd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY scripts /scripts
ONBUILD COPY config/ /config
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
