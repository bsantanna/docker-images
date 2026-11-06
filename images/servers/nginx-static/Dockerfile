FROM nginx:stable-bookworm
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2026-11-06

RUN rm -f /etc/nginx/conf.d/default.conf && \
    mkdir -p /var/www/html/website

COPY conf/global.conf /etc/nginx/conf.d/
COPY conf/nginx.conf /etc/nginx/

VOLUME ["/var/www/html/website"]

CMD ["nginx"]

EXPOSE 80
