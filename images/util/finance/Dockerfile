FROM bsantanna/java-python-exec
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2018-12-30
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
    apt-get install -yqq \
    python3-scipy python3-numpy python3-matplotlib python3-pandas \
    python3-sympy python3-nose python3-oauth2client python3-wheel \
    ipython && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN python3 -m pip install --upgrade \
    google-api-python-client alpha_vantage quandl
