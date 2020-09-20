FROM bsantanna/alpine:armhf
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2018-12-30
#ENV REFRESHED_AT 2019-06-13
ENV REFRESHED_AT 2020-09-20

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories; \
    echo "http://uk.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories; \
    echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "@community http://uk.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk --update --no-cache add \
    ca-certificates curl gcc g++ git libc-dev make \
    openjdk11 openssl-dev openssh-client py-pip@community python2-dev@community python3-dev@community

ADD exec-entrypoint.sh /usr/local/bin/exec-entrypoint
RUN chmod +x /usr/local/bin/exec-entrypoint

ENTRYPOINT ["exec-entrypoint"]
