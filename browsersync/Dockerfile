FROM ubuntu:14.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2016-08-18
ENV REVERSE_PROXY_HOST "dsp.vr.com.br"

RUN apt-get update -qq && apt-get install -y nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g gulp-cli bower browser-sync

EXPOSE 3000 3001 3002

ONBUILD ADD ./entrypoint.js /opt/entrypoint.js

ENTRYPOINT [ "node", "/opt/entrypoint.js" ]
