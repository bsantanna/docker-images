FROM bsantanna/ubuntu:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT 2022-06-04

RUN apt-get update -qq && \
    apt-get install -qqy nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD conf/nginx.conf /etc/nginx/

ONBUILD ADD conf/global.conf /etc/nginx/conf.d/
ONBUILD ADD ssl/ /etc/nginx/ssl/

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
