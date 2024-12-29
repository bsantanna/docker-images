FROM bsantanna/base:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2024-12-29
ENV BITCOIN_RELEASE=v28.0

RUN apt-get update -qq && \
    apt-get install -yqq --no-install-recommends \
      libtool autotools-dev automake pkg-config bsdmainutils python3 python3-dev \
      libevent-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev \
      libminiupnpc-dev libnatpmp-dev libzmq3-dev libdb-dev libdb++-dev libsqlite3-dev \
      libxkbcommon-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /opt && git clone https://github.com/bitcoin/bitcoin.git && \
    cd /opt/bitcoin && git checkout ${BITCOIN_RELEASE} && rm -fr /opt/bitcoin/.git && \
    cd /opt/bitcoin && ./autogen.sh && \
    cd /opt/bitcoin && ./configure CXXFLAGS="-O2" \
      --with-miniupnpc=no --with-natpmp=no --with-incompatible-bdb --without-gui --disable-wallet \
      --prefix=/opt/bitcoin/dist && \
    make && make check && make install && rm -fr /opt/bitcoin/src

ADD entrypoint.sh /opt/bitcoin/docker-entrypoint.sh
ADD conf /opt/bitcoin/conf
RUN chmod +x /opt/bitcoin/docker-entrypoint.sh && mkdir /opt/bitcoin/data

VOLUME /opt/bitcoin/data

EXPOSE 8332

CMD ["bash", "/opt/bitcoin/docker-entrypoint.sh"]

