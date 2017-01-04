FROM bsantanna/frontend-dev
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2016-12-29

ONBUILD ADD ./entrypoint.sh /opt/frontend-dev/entrypoint.sh
ONBUILD RUN chmod +x /opt/frontend-dev/entrypoint.sh

ENTRYPOINT ["/opt/frontend-dev/entrypoint.sh"]

