FROM ubuntu:14.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2015-07-01

RUN apt-get update -qq && apt-get install -qqy nginx

ADD conf/nginx.conf /etc/nginx/

ONBUILD ADD conf/global.conf /etc/nginx/conf.d/
ONBUILD ADD ssl/ /etc/nginx/ssl/

ENTRYPOINT ["nginx"]

EXPOSE 80
EXPOSE 443
