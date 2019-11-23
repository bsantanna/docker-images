FROM bsantanna/java-python-exec
MAINTAINER Bruno Sant'Anna "bruno@btech.software"
ENV CREATED_AT 2019-07-20
ENV APM_ROOT "/usr/share/elastic"
ENV APM_JAVA_AGENT_URI "https://secure.btech.software/repo/iot/elastic/elastic-apm-agent-1.7.0.jar"
ENV APM_JAVA_AGENT_PATH "${APM_ROOT}/agent.jar"

RUN mkdir -p ${APM_ROOT}

RUN set -eux; \
    wget -O ${APM_JAVA_AGENT_PATH} \
    ${APM_JAVA_AGENT_URI} && \
    chmod 755 ${APM_ROOT} && \
    chmod 644 ${APM_JAVA_AGENT_PATH}
