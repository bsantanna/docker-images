FROM ubuntu:15.04
MAINTAINER Bruno Sant'Anna "mail@bsantanna.me"
ENV REFRESHED_AT 2015-06-15

RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -qqy xfce4 tightvncserver
RUN apt-get install -qqy tango-icon-theme tango-icon-theme-extras tango-icon-theme-common human-icon-theme gnome-icon-theme gnome-human-icon-theme
RUN apt-get install -qqy language-pack-pt language-pack-pt-base
RUN update-locale pt_BR.UTF-8
ENV LC_ALL=pt_BR.UTF-8

RUN rm -fr /usr/bin/apt-get /usr/bin/dpkg /usr/lib/dpkg

WORKDIR /data

ADD setup/root/vnc /root/.vnc
ADD setup/root/config /root/.config

ENV USER root
ENTRYPOINT ["/bin/bash"]
CMD ["-c", "/usr/bin/vncserver :1 && tail -f /root/.vnc/*.log"]

EXPOSE 5901
