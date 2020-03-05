FROM bsantanna/alpine:armhf
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2017-08-02
#ENV REFRESHED_AT 2018-05-12
#ENV REFRESHED_AT 2018-08-23
#ENV REFRESHED_AT 2019-05-12
#ENV REFRESHED_AT 2019-06-13
#ENV REFRESHED_AT 2019-07-14
ENV REFRESHED_AT 2020-03-05
ENV WORKSPACE_DIR /opt/workspace
ENV CI=true

RUN apk --update --no-cache add bash npm
RUN mkdir /opt/npm-dev
ADD npm-entrypoint.sh /usr/local/bin/npm-entrypoint
RUN chmod +x /usr/local/bin/npm-entrypoint

RUN mkdir ${WORKSPACE_DIR}
WORKDIR ${WORKSPACE_DIR}
VOLUME ["${WORKSPACE_DIR}"]

EXPOSE 9000

ENTRYPOINT ["npm-entrypoint"]
