FROM bsantanna/ubuntu-multi:14.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2016-12-29
#ENV REFRESHED_AT 2018-05-12
ENV REFRESHED_AT 2018-08-19
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && \
    apt-get install -yqq openjdk-7-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-armhf/
CMD ["${JAVA_HOME}/bin/java", "-version"]
