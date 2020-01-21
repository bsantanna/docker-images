FROM bsantanna/maven-build:x86_64
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
#ENV CREATED_AT 2018-12-30
ENV REFRESHED_AT 2019-06-13

RUN apk --update add --no-cache --virtual \
    build-deps bash ca-certificates curl gcc g++ git libc-dev make openjdk8 openssl-dev openssh-client py-pip python-dev python3-dev

ADD exec-entrypoint.sh /usr/local/bin/exec-entrypoint
RUN chmod +x /usr/local/bin/exec-entrypoint

ENTRYPOINT ["exec-entrypoint"]