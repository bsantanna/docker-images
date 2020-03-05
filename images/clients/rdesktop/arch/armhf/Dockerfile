FROM bsantanna/alpine:armhf
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2017-10-11
#ENV REFRESHED_AT 2018-08-19
#ENV REFRESHED_AT 2019-06-12
ENV REFRESHED_AT 2020-03-05

RUN apk --update --no-cache add rdesktop

ENTRYPOINT ["/usr/bin/rdesktop", "-f"]
