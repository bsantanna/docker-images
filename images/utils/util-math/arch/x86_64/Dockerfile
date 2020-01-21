FROM bsantanna/java-python-exec
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2019-07-20

RUN apk --update add libffi-dev openblas-dev freetype-dev cython automake

RUN pip3 install --upgrade cython
RUN pip3 install --upgrade numpy
RUN pip3 install --upgrade scipy
RUN pip3 install --upgrade matplotlib
RUN pip3 install --upgrade pandas
RUN pip3 install --upgrade sympy
