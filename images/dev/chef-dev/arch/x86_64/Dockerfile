FROM bsantanna/ubuntu:x86_64
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2017-04-28
#ENV REFRESHED_AT 2018-09-08
#ENV REFRESHED_AT 2019-06-18
ENV REFRESHED_AT 2020-03-05

ENV DEBIAN_FRONTEND noninteractive
ENV EDITOR=vim
ENV CHEF_DIR /opt/chef
#ENV TZ=America/Sao_Paulo
ENV TZ=Europe/Amsterdam

RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
RUN mkdir ${CHEF_DIR}
RUN apt-get update -qq && \
    apt-get install -qqy ruby-dev chef vim tmux jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN gem install chef-vault --no-ri --no-rdoc

VOLUME /opt/workspace/chef-repo
WORKDIR /opt/workspace/chef-repo
