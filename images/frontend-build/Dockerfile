FROM bsantanna/frontend-dev
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2016-12-29
ENV REFRESHED_AT 2018-05-12
ENV DEBIAN_FRONTEND noninteractive

ONBUILD ADD ./entrypoint.sh /opt/frontend-dev/entrypoint.sh
ONBUILD RUN chmod +x /opt/frontend-dev/entrypoint.sh

ENTRYPOINT ["/opt/frontend-dev/entrypoint.sh"]

