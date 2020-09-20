FROM bsantanna/java-python-exec:armhf
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2019-07-20
ENV REFRESHED_AT 2020-09-20

RUN echo http://uk.alpinelinux.org/alpine/edge/main > /etc/apk/repositories; \
    echo http://uk.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk --update add py3-numpy@community
RUN apk --update add py3-scipy@community
RUN apk --update add py3-pandas@community
RUN apk --update add py3-matplotlib@community
RUN pip3 install --upgrade sympy
