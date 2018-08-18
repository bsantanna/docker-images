# based on https://github.com/bsantanna/rpi-chrometainer
FROM bsantanna/openssh-client
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV DEBIAN_FRONTEND=noninteractive
ENV REFRESHED_AT 2017-10-11

RUN apt-get update -q && apt-get install -yqq rdesktop && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/bin/rdesktop", "-f"]
