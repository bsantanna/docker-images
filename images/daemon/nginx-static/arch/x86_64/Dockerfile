FROM bsantanna/ubuntu
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2016-12-29
ENV REFRESHED_AT 2018-08-19
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
    apt-get install -qqy nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/www/html/website
ADD conf/global.conf /etc/nginx/conf.d/
ADD conf/nginx.conf /etc/nginx/

VOLUME ["/var/www/html/website"]

ENTRYPOINT ["nginx"]

EXPOSE 80
