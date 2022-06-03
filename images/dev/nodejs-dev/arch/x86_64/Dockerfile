FROM bsantanna/ubuntu:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT 2022-06-03
ENV WORKSPACE_DIR /opt/workspace
ENV CI=true

RUN apt-get update -qq && \
    apt-get install -yqq ca-certificates nodejs npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

RUN mkdir ${WORKSPACE_DIR}
WORKDIR ${WORKSPACE_DIR}
VOLUME ["${WORKSPACE_DIR}"]

EXPOSE 9000

CMD ["entrypoint"]
