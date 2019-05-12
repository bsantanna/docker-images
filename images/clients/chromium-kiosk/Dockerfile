FROM bsantanna/ubuntu
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2017-05-22
ENV REFRESHED_AT 2018-08-19
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -yqq ca-certificates libexif-dev libpango1.0-0 libv4l-0 chromium-browser && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/bin/chromium", "--user-data-dir=/tmp", "--disable-setuid-sandbox", "--kiosk"]
