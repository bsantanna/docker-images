FROM bsantanna/base:latest
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2024-12-29

RUN apt update -qq && \
    apt install -qqy nginx && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD conf/nginx.conf /etc/nginx/

ONBUILD ADD conf/global.conf /etc/nginx/conf.d/
ONBUILD ADD ssl/ /etc/nginx/ssl/

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
