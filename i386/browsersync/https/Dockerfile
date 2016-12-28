FROM bsantanna/browsersync
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2016-08-19

ADD ./entrypoint.sh /opt/browsersync/entrypoint.sh
ADD ./proxy.js /opt/browsersync/proxy.js
ADD ./ssl_proxy.js /opt/browsersync/ssl_proxy.js

RUN chmod +x /opt/browsersync/entrypoint.sh

EXPOSE 3000 3001 3002 3003

ENTRYPOINT ["/opt/browsersync/entrypoint.sh"]
