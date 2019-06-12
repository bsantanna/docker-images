FROM bsantanna/alpine
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2018-12-30
ENV REFRESHED_AT 2019-06-13
ENV WORKSPACE_DIR /opt/workspace

RUN apk --update add --no-cache --virtual \
    build-deps bash ca-certificates curl gcc git libc-dev make openjdk8 openssl-dev openssh-client py-pip python-dev python3-dev

ADD exec-entrypoint.sh /usr/local/bin/exec-entrypoint
RUN chmod +x /usr/local/bin/exec-entrypoint

RUN mkdir -p ${WORKSPACE_DIR}
WORKDIR ${WORKSPACE_DIR}
VOLUME ["${WORKSPACE_DIR}"]
ENTRYPOINT ["exec-entrypoint"]