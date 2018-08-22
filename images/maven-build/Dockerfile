FROM bsantanna/java-dev
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2018-05-12
ENV REFRESHED_AT 2018-08-18
ENV DEBIAN_FRONTEND noninteractive

ADD config/settings.xml /etc/maven/settings.xml

ADD ./entrypoint.sh /opt/java-dev/entrypoint.sh
RUN chmod +x /opt/java-dev/entrypoint.sh


RUN mkdir /opt/workspace
WORKDIR /opt/workspace

ENTRYPOINT ["/opt/java-dev/entrypoint.sh"]

