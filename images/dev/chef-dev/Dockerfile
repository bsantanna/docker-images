FROM bsantanna/java-ruby-dev:latest
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2024-12-30
ENV RUBYOPT=-W0

RUN curl -s -L https://omnitruck.cinc.sh/install.sh | bash -s -- -v 18 && \
    gem install knife -v 18.5.0 --no-doc

VOLUME /opt/workspace/chef-repo
WORKDIR /opt/workspace/chef-repo
