FROM bsantanna/ubuntu-multi:16.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2016-12-29
#ENV REFRESHED_AT 2018-05-12
ENV REFRESHED_AT 2018-08-19
ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

RUN apt-get update -q && \
    apt-get install -yqq openjdk-8-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/usr/lib/jvm/java-8-openjdk-amd64/bin/java", "-version"]
