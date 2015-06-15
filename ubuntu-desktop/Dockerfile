FROM ubuntu:15.10
MAINTAINER Bruno Sant'Anna "mail@bsantanna.me"
ENV REFRESHED_AT 2015-06-15

RUN apt-get update -qq && \
  DEBIAN_FRONTEND=noninteractive apt-get install -qqy lxde-core tightvncserver && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /data

ADD vnc /root/.vnc

ENV USER root

ENTRYPOINT ["/bin/bash"]

CMD ["-c", "/usr/bin/vncserver :1 && tail -f /root/.vnc/*.log"]

EXPOSE 5901
