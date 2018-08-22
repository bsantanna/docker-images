FROM bsantanna/openjdk-8-jdk
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2018-05-12
ENV REFRESHED_AT 2018-08-19
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
    apt-get install -yqq maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /opt/java-dev
ONBUILD ADD ./entrypoint.sh /opt/java-dev/entrypoint.sh
ONBUILD RUN chmod +x /opt/java-dev/entrypoint.sh

ENV WORKSPACE_DIR /opt/workspace
RUN mkdir ${WORKSPACE_DIR}
WORKDIR ${WORKSPACE_DIR}
VOLUME ["${WORKSPACE_DIR}"]

ENTRYPOINT ["/opt/java-dev/entrypoint.sh"]
