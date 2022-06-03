FROM bsantanna/ubuntu:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT 2022-06-03

ENV EDITOR=vim

RUN curl -s -L https://omnitruck.cinc.sh/install.sh | bash -s -- -v 17 && \
    apt-get update -qq && \
    apt-get install -qqy ruby-dev vim tmux jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

VOLUME /opt/workspace/chef-repo
WORKDIR /opt/workspace/chef-repo
