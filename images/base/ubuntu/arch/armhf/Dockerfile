FROM eclipse-temurin:17
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT 2022-06-03
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Amsterdam
#ENV TZ=America/Sao_Paulo

RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
