FROM bsantanna/ubuntu:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT 2022-06-03
ENV DEBIAN_FRONTEND noninteractive
ENV BITCOIN_RELEASE bitcoin-22.0
ENV BITCOIN_CORE_RELEASE bitcoin-core-22.0
ENV TARGET_ENV x86_64-linux-gnu

RUN apt-get update -qq && \
    apt-get install -yqq wget && \
    mkdir -p /opt/bitcoin/data && mkdir -p /opt/bitcoin/dist && \
        cd /tmp/ && wget -q "https://bitcoin.org/bin/${BITCOIN_CORE_RELEASE}/${BITCOIN_RELEASE}-${TARGET_ENV}.tar.gz" && \
        tar -zxf ${BITCOIN_RELEASE}-${TARGET_ENV}.tar.gz && mv ${BITCOIN_RELEASE}/* /opt/bitcoin/dist/ && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD entrypoint.sh /opt/bitcoin/docker-entrypoint.sh
ADD conf /opt/bitcoin/conf
RUN chmod +x /opt/bitcoin/docker-entrypoint.sh

VOLUME /opt/bitcoin/data

EXPOSE 8332

CMD ["bash", "/opt/bitcoin/docker-entrypoint.sh"]
