FROM bsantanna/java-ruby-dev:latest
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2026-11-06
ENV RUBYOPT=-W0

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update -qq && \
    apt-get install -yqq --no-install-recommends libarchive13t64 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -fsSL https://omnitruck.cinc.sh/install.sh | bash -s -- -v 18 && \
    gem install knife -v 18.10.18 --no-doc

VOLUME /opt/workspace/chef-repo
WORKDIR /opt/workspace/chef-repo
