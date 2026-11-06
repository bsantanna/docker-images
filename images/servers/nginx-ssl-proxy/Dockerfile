FROM nginx:stable-bookworm
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2026-11-06

RUN rm -f /etc/nginx/conf.d/default.conf

COPY conf/nginx.conf /etc/nginx/

ONBUILD COPY conf/global.conf /etc/nginx/conf.d/
ONBUILD COPY ssl/ /etc/nginx/ssl/

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
