FROM bsantanna/npm-dev
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2016-12-29
#ENV REFRESHED_AT 2018-05-12
#ENV REFRESHED_AT 2018-08-18
ENV REFRESHED_AT 2019-06-17

ADD npm-entrypoint.sh /usr/local/bin/npm-entrypoint
RUN chmod +x /usr/local/bin/npm-entrypoint

ENTRYPOINT ["npm-entrypoint"]
