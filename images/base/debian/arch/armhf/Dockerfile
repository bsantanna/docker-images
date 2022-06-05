FROM debian:buster
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT 2022-06-04
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Amsterdam
#ENV TZ=America/Sao_Paulo

RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

RUN apt-get update -q && \
    apt-get install -yqq ca-certificates openjdk-11-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]
