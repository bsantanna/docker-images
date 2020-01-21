FROM bsantanna/npm-dev:x86_64
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2016-12-29
#ENV REFRESHED_AT 2018-05-12
#ENV REFRESHED_AT 2018-08-18
ENV REFRESHED_AT 2019-06-17

ADD npm-entrypoint.sh /usr/local/bin/npm-entrypoint
RUN chmod +x /usr/local/bin/npm-entrypoint

RUN npm install -g webpack

ENTRYPOINT ["npm-entrypoint"]
