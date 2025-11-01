FROM eclipse-temurin:24-jdk-noble
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2025-11-01
ENV DEBIAN_FRONTEND=noninteractive
ENV EDITOR=vim

RUN apt update -qq && \
    apt install -yqq --no-install-recommends ca-certificates curl build-essential git jq openssh-client tmux vim && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]
