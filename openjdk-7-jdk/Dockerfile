FROM ubuntu:14.04
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2015-06-01

RUN apt-get update -qq && apt-get install -qqy ca-certificates openjdk-7-jdk

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/

ENTRYPOINT ["/usr/lib/jvm/java-7-openjdk-amd64/bin/java"]
CMD ["-version"]
