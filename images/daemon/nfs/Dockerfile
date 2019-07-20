FROM bsantanna/alpine
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2017-05-16
#ENV REFRESHED_AT 2018-08-19
ENV REFRESHED_AT 2019-07-20

RUN apk --update add --no-cache --virtual unfs3

ADD nfs-entrypoint.sh /usr/local/bin/nfs-entrypoint
RUN chmod +x /usr/local/bin/nfs-entrypoint

EXPOSE 111 111/udp 2049 2049/udp

VOLUME ["/etc/exports"]

ENTRYPOINT ["nfs-entrypoint"]
