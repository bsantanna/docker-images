# based on https://github.com/langri-sha/npm_lazy
FROM bsantanna/frontend-dev
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2016-10-25

VOLUME ["/root/.npm_lazy"]

RUN mkdir -p /opt/workspace/lib
ADD ./cache.js /opt/workspace/cache.js
ADD ./package.json /opt/workspace/package.json
ADD ./lib/utils.js /opt/workspace/lib/utils.js

RUN cd /opt/workspace && npm install

EXPOSE 8080

ENTRYPOINT ["/opt/frontend-dev/entrypoint.sh"]
