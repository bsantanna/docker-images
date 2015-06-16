FROM ubuntu:14.04
MAINTAINER Bruno Sant'Anna "mail@bsantanna.me"
ENV REFRESHED_AT 2015-06-16

RUN apt-get update -qq && apt-get install -qqy nginx

RUN mkdir -p /var/www/html/website
ADD conf/global.conf /etc/nginx/conf.d/
ADD conf/nginx.conf /etc/nginx/

ENTRYPOINT ["nginx"]

EXPOSE 80
