FROM bsantanna/java-python-exec
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2018-12-30
ENV DEBIAN_FRONTEND noninteractive

RUN python3 -m pip install --upgrade \
    google-api-python-client oauth2client alpha_vantage \
    numpy scipy matplotlib ipython pandas \
    pandas-datareader sympy nose quandl
