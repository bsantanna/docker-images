FROM bsantanna/ubuntu-multi:16.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2017-10-26

RUN export DEBIAN_FRONTEND='noninteractive' && apt-get update -qq && apt-get install -qqy ca-certificates ddclient

ONBUILD ADD config/ddclient.conf /etc/ddclient.conf

ADD entrypoint.sh /sbin/entrypoint
RUN chmod +x /sbin/entrypoint

ENTRYPOINT ["/sbin/entrypoint"]
