FROM bsantanna/openssh-client
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2016-12-29

RUN apt-get update -qq && apt-get install -qqy nginx

ADD conf/nginx.conf /etc/nginx/

ONBUILD ADD conf/global.conf /etc/nginx/conf.d/
ONBUILD ADD ssl/ /etc/nginx/ssl/

ENTRYPOINT ["nginx"]

EXPOSE 80
EXPOSE 443
