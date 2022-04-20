FROM bsantanna/maven-build:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
#ENV CREATED_AT 2018-12-30
#ENV REFRESHED_AT 2019-06-13
ENV REFRESHED_AT 2020-04-26

RUN apk --update --no-cache add \
    bash ca-certificates curl gcc g++ git libc-dev make \
    openjdk8 openssl-dev openssh-client py-pip python2-dev python3-dev

ADD exec-entrypoint.sh /usr/local/bin/exec-entrypoint
RUN chmod +x /usr/local/bin/exec-entrypoint

ENTRYPOINT ["exec-entrypoint"]
