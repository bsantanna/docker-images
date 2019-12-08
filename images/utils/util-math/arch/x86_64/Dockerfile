FROM bsantanna/java-python-exec
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2019-07-20

RUN apk --update add libffi-dev openblas-dev freetype-dev cython

RUN pip3 install --upgrade cython && \
    pip3 install --upgrade numpy && \
    pip3 install --upgrade scipy && \
    pip3 install --upgrade matplotlib && \
    pip3 install --upgrade pandas && \
    pip3 install --upgrade sympy
