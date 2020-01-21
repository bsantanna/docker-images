FROM bsantanna/alpine:x86_64
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2017-05-22
#ENV REFRESHED_AT 2018-08-19
ENV REFRESHED_AT 2019-06-12

RUN apk --update add --no-cache --virtual ca-certificates chromium

ENTRYPOINT ["/usr/bin/chromium", "--user-data-dir=/tmp", "--disable-setuid-sandbox", "--kiosk"]
