FROM ubuntu:20.04
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV CREATED_AT 2021-03-06
ENV DEBIAN_FRONTEND noninteractive
ENV BITCOIN_RELEASE v0.21.0

RUN apt-get update -qq && \
    apt-get install -yqq \
      git curl build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 \
      libevent-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev \
      libminiupnpc-dev libnatpmp-dev libzmq3-dev libdb-dev libdb++-dev libsqlite3-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /opt/bitcoin/data
ADD entrypoint.sh /opt/bitcoin/docker-entrypoint.sh
ADD conf /opt/bitcoin/conf
RUN chmod +x /opt/bitcoin/docker-entrypoint.sh

VOLUME /opt/bitcoin/data

EXPOSE 8332

ENTRYPOINT ["bash", "/opt/bitcoin/docker-entrypoint.sh"]
