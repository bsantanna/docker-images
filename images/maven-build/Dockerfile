FROM bsantanna/java-dev
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2018-05-12
ENV REFRESHED_AT 2018-08-18
ENV DEBIAN_FRONTEND noninteractive

# settings.xml adjusts mave local repository to use #${WORKSPACE} env
# defined in bsantanna/java-dev
ADD config/settings.xml /etc/maven/settings.xml

ADD ./entrypoint.sh /opt/java-dev/entrypoint.sh
RUN chmod +x /opt/java-dev/entrypoint.sh

ENTRYPOINT ["/opt/java-dev/entrypoint.sh"]

