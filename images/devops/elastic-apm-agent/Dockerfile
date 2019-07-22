FROM bsantanna/java-python-exec
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2019-07-20
ENV ELASTIC_AGENT_ROOT "/usr/share/elastic"
ENV JAVA_AGENT_URI "https://secure.btech.software/repo/iot/elastic/elastic-apm-agent-1.7.0.jar"
ENV JAVA_AGENT_PATH "${ELASTIC_AGENT_ROOT}/agent.jar"

RUN mkdir -p ${ELASTIC_AGENT_ROOT}

RUN set -eux; \
    wget -O ${JAVA_AGENT_PATH} \
    ${JAVA_AGENT_URI} && \
    chmod 755 ${ELASTIC_AGENT_ROOT} && \
    chmod 644 ${JAVA_AGENT_PATH}
