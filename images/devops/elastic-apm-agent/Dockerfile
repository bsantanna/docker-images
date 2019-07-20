FROM bsantanna/java-python-exec
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2019-07-20
ENV JAVA_AGENT_VERSION 1.70
ENV JAVA_OPTS "java -javaagent:/usr/share/elastic/agent.jar -Delastic.apm.service_name=${ELASTIC_APM_JAVA_SERVICE_NAME} -Delastic.apm.application_packages=${ELASTIC_APM_JAVA_BASE_PACKAGE}.* -Delastic.apm.server_urls=${ELASTIC_APM_SERVER_URL}"

RUN mkdir -p /usr/share/elastic/

RUN set -eux; \
    wget -O /usr/share/elastic/agent.jar \
    https://search.maven.org/remotecontent?filepath=co/elastic/apm/elastic-apm-agent/${JAVA_AGENT_VERSION}/elastic-apm-agent-${JAVA_AGENT_VERSION}.jar && \
    chmod 755 /usr/share/elastic && \
    chmod 644 /usr/share/elastic/agent.jar
