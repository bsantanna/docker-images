FROM bsantanna/ubuntu-multi:16.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2017-04-18

RUN apt-get update -qq && apt-get install -qqy nfs-kernel-server

ADD scripts/ /scripts
ADD config/ /config
ONBUILD ADD config/ /config
ONBUILD RUN mv /config/idmapd.conf /etc/idmapd.conf
ONBUILD RUN mv /config/exports /etc/exports


CMD ["/bin/bash", "/scripts/runtime/service_exec.sh"]


EXPOSE 111/udp
EXPOSE 111
EXPOSE 2049
EXPOSE 2049/udp

#RESTART: https://github.com/ErezHorev/dockerized_nfs_server