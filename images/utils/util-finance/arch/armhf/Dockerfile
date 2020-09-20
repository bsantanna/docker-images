FROM bsantanna/util-math:armhf
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2018-12-30
ENV REFRESHED_AT 2020-09-20

RUN echo http://uk.alpinelinux.org/alpine/edge/main > /etc/apk/repositories; \
    echo http://uk.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories

RUN pip3 install --upgrade oauth2client google-api-python-client alpha_vantage quandl
