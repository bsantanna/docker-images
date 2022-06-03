FROM bsantanna/ubuntu:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT 2022-06-03

RUN apt-get update -qq && \
    apt-get install -qqy nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/www/html/website
ADD conf/global.conf /etc/nginx/conf.d/
ADD conf/nginx.conf /etc/nginx/

VOLUME ["/var/www/html/website"]

CMD ["nginx"]

EXPOSE 80
