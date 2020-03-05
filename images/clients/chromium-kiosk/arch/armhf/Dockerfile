FROM bsantanna/alpine:armhf
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2017-05-22
#ENV REFRESHED_AT 2018-08-19
#ENV REFRESHED_AT 2019-06-12
ENV REFRESHED_AT 2020-03-05

RUN apk --update --no-cache add ca-certificates chromium

ENTRYPOINT ["/usr/bin/chromium", "--user-data-dir=/tmp", "--disable-setuid-sandbox", "--kiosk"]
