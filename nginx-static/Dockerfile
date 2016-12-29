FROM bsantanna/openssh-client
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2016-12-29

RUN apt-get update -qq && apt-get install -qqy nginx

RUN mkdir -p /var/www/html/website
ADD conf/global.conf /etc/nginx/conf.d/
ADD conf/nginx.conf /etc/nginx/

VOLUME ["/var/www/html/website"]

ENTRYPOINT ["nginx"]

EXPOSE 80
