FROM bsantanna/java-ruby-dev:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2024-12-29

RUN curl -s -L https://omnitruck.cinc.sh/install.sh | bash -s -- -v 17 && \
    gem install knife -v 17.10.0 --no-doc

VOLUME /opt/workspace/chef-repo
WORKDIR /opt/workspace/chef-repo
