FROM bsantanna/ubuntu:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT 2022-06-03
ENV EDITOR=vim

RUN apt-get update -qq && \
    apt-get install -yqq --no-install-recommends ca-certificates build-essential vim tmux jq nodejs npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

