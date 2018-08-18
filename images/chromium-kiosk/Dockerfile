# based on https://github.com/dougborg/rpi-chrometainer
FROM bsantanna/openssh-client
MAINTAINER Bruno Sant'Anna "bruno@btech.software"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      ca-certificates \
      libexif-dev \
      libpango1.0-0 \
      libv4l-0 \
      chromium-browser && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/bin/chromium", "--user-data-dir=/tmp", "--disable-setuid-sandbox", "--kiosk"]
