FROM bsantanna/java-python-exec
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2018-12-30
ENV DEBIAN_FRONTEND noninteractive

RUN apk --update add libffi-dev openblas-dev

RUN pip3 install --upgrade numpy scipy matplotlib pandas sympy oauth2client google-api-python-client alpha_vantage quandl
