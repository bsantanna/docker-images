FROM ubuntu:20.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2021-03-06
ENV DEBIAN_FRONTEND noninteractive
ENV BITCOIN_RELEASE v0.21.0
ENV CONFIG_OPTS --with-incompatible-bdb --with-gui=no --prefix=/opt/bitcoin/depends/x86_64-pc-linux-gnu --with-miniupnpc --enable-upnp-default --with-natpmp --enable-natpmp-default

RUN apt-get update -qq && \
    apt-get install -yqq \
      git curl build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 \
      libevent-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev \
      libminiupnpc-dev libnatpmp-dev libzmq3-dev libdb-dev libdb++-dev libsqlite3-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /opt && git clone https://github.com/bitcoin/bitcoin.git && \
    cd /opt/bitcoin && git checkout ${BITCOIN_RELEASE} && rm -fr /opt/bitcoin/.git && \
    cd /opt/bitcoin && ./autogen.sh && \
    cd /opt/bitcoin/depends && make && \
    cd /opt/bitcoin && ./configure ${CONFIG_OPTS}  && \
    make && make check && make install && \
    mv /opt/bitcoin/depends/x86_64-pc-linux-gnu /opt/bitcoin/dist && \
    rm -fr /opt/bitcoin/depends && rm -fr /opt/bitcoin/src

ADD entrypoint.sh /opt/bitcoin/docker-entrypoint.sh
ADD conf /opt/bitcoin/conf
RUN chmod +x /opt/bitcoin/docker-entrypoint.sh && mkdir /opt/bitcoin/data

VOLUME /opt/bitcoin/data

EXPOSE 8332

ENTRYPOINT ["bash", "/opt/bitcoin/docker-entrypoint.sh"]
