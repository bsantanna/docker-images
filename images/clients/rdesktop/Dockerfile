FROM bsantanna/alpine
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2017-10-11
#ENV REFRESHED_AT 2018-08-19
ENV REFRESHED_AT 2019-06-12

RUN apk --update add --no-cache --virtual rdesktop

ENTRYPOINT ["/usr/bin/rdesktop", "-f"]
