FROM ubuntu:15.04
MAINTAINER Bruno Sant'Anna "mail@bsantanna.me"
ENV REFRESHED_AT 2015-06-15

RUN apt-get update -qq && apt-get install -qqy xfce4 tightvncserver

WORKDIR /data

ADD vnc /root/.vnc

ENV USER root

ENTRYPOINT ["/bin/bash"]

CMD ["-c", "/usr/bin/vncserver :1 && tail -f /root/.vnc/*.log"]

EXPOSE 5901
