FROM bsantanna/alpine:armhf
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2017-05-22
ENV REFRESHED_AT 2020-09-20

RUN echo http://uk.alpinelinux.org/alpine/edge/main > /etc/apk/repositories; \
    echo http://uk.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories

RUN apk --update --no-cache add ca-certificates chromium

ENTRYPOINT ["/usr/bin/chromium", "--user-data-dir=/tmp", "--disable-setuid-sandbox", "--kiosk"]
