FROM bsantanna/backend-dev
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2016-12-29

ONBUILD ADD ./entrypoint.sh /opt/backend-dev/entrypoint.sh
ONBUILD RUN chmod +x /opt/backend-dev/entrypoint.sh

ENTRYPOINT ["/opt/backend-dev/entrypoint.sh"]

