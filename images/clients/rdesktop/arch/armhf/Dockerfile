FROM bsantanna/alpine:armhf
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2017-10-11
ENV REFRESHED_AT 2020-09-20

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories; \
    echo "http://uk.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories; \
    echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "@community http://uk.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk --update --no-cache add rdesktop

ENTRYPOINT ["/usr/bin/rdesktop", "-f"]
