FROM bsantanna/ubuntu-multi:16.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2017-05-16
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get install -qqy build-essential flex bison nfs-client curl && apt-get clean all

ADD http://iweb.dl.sourceforge.net/project/unfs3/unfs3/0.9.22/unfs3-0.9.22.tar.gz /src/unfs3

RUN cd /src/unfs3 && tar -zxf unfs3-0.9.22.tar.gz && \
    cd unfs3-0.9.22 && ./configure && make && make install

ADD scripts/ /scripts
#ONBUILD ADD config/ /config
#ONBUILD RUN mv /config/exports /etc/exports

EXPOSE 111 111/udp 2049 2049/udp

CMD ["/bin/bash", "/scripts/runtime/service_exec.sh"]