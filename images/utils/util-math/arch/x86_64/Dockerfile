FROM bsantanna/java-python-exec
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
# ENV CREATED_AT 2019-07-20
ENV REFRESHED_AT 2020-01-21

RUN apk --update add py3-scipy && \
    apk --update add py3-numpy && \
    apk --update add py3-matplotlib && \
    apk --update add py3-pandas

RUN pip3 install --upgrade sympy
