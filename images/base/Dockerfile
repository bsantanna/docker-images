FROM eclipse-temurin:25-jdk-noble
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2026-11-06
ENV DEBIAN_FRONTEND=noninteractive
ENV EDITOR=vim

RUN apt-get update -qq && \
    apt-get install -yqq --no-install-recommends ca-certificates curl build-essential git jq openssh-client tmux vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]
