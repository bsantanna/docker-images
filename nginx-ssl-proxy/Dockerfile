FROM ubuntu:14.04
MAINTAINER Bruno Sant'Anna "mail@bsantanna.me"
ENV REFRESHED_AT 2015-06-16

RUN apt-get update -qq && apt-get install -qqy nginx

ADD conf/nginx.conf /etc/nginx/

ONBUILD ADD conf/global.conf /etc/nginx/conf.d/
ONBUILD ADD ssl/cert.crt /etc/nginx/ssl
ONBUILD ADD ssl/cert.key /etc/nginx/ssl

ENTRYPOINT ["nginx"]

EXPOSE 80
EXPOSE 443
