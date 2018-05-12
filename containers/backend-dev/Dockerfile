FROM bsantanna/openjdk-8-jdk
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV REFRESHED_AT 2018-05-12

RUN apt-get update -qq && apt-get install -yqq maven

RUN mkdir /opt/backend-dev
ONBUILD ADD ./entrypoint.sh /opt/backend-dev/entrypoint.sh
ONBUILD RUN chmod +x /opt/backend-dev/entrypoint.sh

ENV WORKSPACE_DIR /opt/workspace
RUN mkdir ${WORKSPACE_DIR}
WORKDIR ${WORKSPACE_DIR}
VOLUME ["${WORKSPACE_DIR}"]

ENTRYPOINT ["/opt/backend-dev/entrypoint.sh"]
