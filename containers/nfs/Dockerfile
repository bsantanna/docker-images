FROM bsantanna/ubuntu-multi:16.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2017-04-18

RUN apt-get update -qq && apt-get install -qqy netbase nfs-kernel-server

ADD scripts/ /scripts
ONBUILD ADD config/ /config
ONBUILD RUN mv /config/exports /etc/exports

EXPOSE 111/udp
EXPOSE 2049

CMD ["/bin/bash", "/scripts/runtime/service_exec.sh"]