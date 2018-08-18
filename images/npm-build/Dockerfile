FROM bsantanna/npm-dev
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2016-12-29
#ENV REFRESHED_AT 2018-05-12
ENV REFRESHED_AT 2018-08-18
ENV DEBIAN_FRONTEND noninteractive

ONBUILD ADD ./entrypoint.sh /opt/npm-dev/entrypoint.sh
ONBUILD RUN chmod +x /opt/npm-dev/entrypoint.sh

ENTRYPOINT ["/opt/npm-dev/entrypoint.sh"]

