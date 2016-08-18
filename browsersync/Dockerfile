FROM ubuntu:14.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2016-08-18

RUN apt-get update -qq && apt-get install -y nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN mkdir /opt/browsersync
WORKDIR /opt/browsersync

ADD ./entrypoint.sh /opt/browsersync/entrypoint.sh
ADD ./proxy.js /opt/browsersync/proxy.js
ADD ./package.json /opt/browsersync/package.json

RUN chmod +x /opt/browsersync/entrypoint.sh
RUN cd /opt/browsersync && npm install

EXPOSE 3000 3001 3002

ENV REVERSE_PROXY_HOST "btech.software"

ENTRYPOINT ["/opt/browsersync/entrypoint.sh"]
