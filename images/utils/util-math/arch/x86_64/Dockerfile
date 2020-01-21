FROM bsantanna/java-python-exec:x86_64
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
# ENV CREATED_AT 2019-07-20
ENV REFRESHED_AT 2020-01-21

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk --update add py3-numpy
RUN apk --update add py3-scipy
RUN apk --update add py3-pandas@testing
RUN apk --update add py3-matplotlib@testing
RUN pip3 install --upgrade sympy
