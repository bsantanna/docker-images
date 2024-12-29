FROM bsantanna/base:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2024-12-29

RUN apt update -qq && \
    apt install -qqy nginx && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/www/html/website
ADD conf/global.conf /etc/nginx/conf.d/
ADD conf/nginx.conf /etc/nginx/

VOLUME ["/var/www/html/website"]

CMD ["nginx"]

EXPOSE 80
