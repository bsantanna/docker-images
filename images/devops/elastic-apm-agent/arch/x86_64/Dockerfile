FROM bsantanna/util-math:x86_64
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT 2022-12-04
ENV APM_ROOT "/usr/share/elastic"
ENV APM_JAVA_AGENT_URI "https://secure.btech.software/repo/iot/elastic/elastic-apm-agent-1.7.0.jar"
ENV APM_JAVA_AGENT_PATH "${APM_ROOT}/agent.jar"

RUN apt-get update -qq && \
    apt-get install -yqq ca-certificates wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p ${APM_ROOT}

RUN set -eux; \
    wget -O ${APM_JAVA_AGENT_PATH} \
    ${APM_JAVA_AGENT_URI} && \
    chmod 755 ${APM_ROOT} && \
    chmod 644 ${APM_JAVA_AGENT_PATH}
