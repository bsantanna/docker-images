FROM bsantanna/alpine
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2017-05-16
#ENV REFRESHED_AT 2018-08-19
ENV REFRESHED_AT 2019-02-12
ENV UNFS3_VERSION 0.9.22

RUN apk --update add --no-cache --virtual \
    build-deps bash ca-certificates wget gcc git libc-dev make

RUN set -eux; \
    mkdir /tmp/unfs3 && \
    wget  -O /tmp/unfs3/src.tar.gz \
    http://iweb.dl.sourceforge.net/project/unfs3/unfs3/${UNFS3_VERSION}/unfs3-${UNFS3_VERSION}.tar.gz && \
    cd /tmp/unfs3 && tar -zxf src.tar.gz && cd src && ./configure && make && make install && cd /tmp && rm -fr ./unfs3

ONBUILD ADD config/exports /etc/exports
ADD nfs-entrypoint.sh /usr/local/bin/nfs-entrypoint
RUN chmod +x /usr/local/bin/nfs-entrypoint

EXPOSE 111 111/udp 2049 2049/udp

ENTRYPOINT ["nfs-entrypoint"]
