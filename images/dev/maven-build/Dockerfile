FROM bsantanna/base:latest
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2026-11-06
ENV WORKSPACE_DIR=/opt/workspace
ENV MAVEN_THREAD_COUNT=8

ARG MAVEN_VERSION=3.9.11
ARG MAVEN_SHA512=bcfe4fe305c962ace56ac7b5fc7a08b87d5abd8b7e89027ab251069faebee516b0ded8961445d6d91ec1985dfe30f8153268843c89aa392733d1a3ec956c9978

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN set -eux; \
    curl -fsSL "https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" -o /tmp/maven.tar.gz; \
    echo "${MAVEN_SHA512}  /tmp/maven.tar.gz" | sha512sum -c -; \
    mkdir -p /opt/maven "${WORKSPACE_DIR}"; \
    tar -xzf /tmp/maven.tar.gz -C /opt/maven --strip-components=1; \
    rm -rf /tmp/maven.tar.gz

ENV MAVEN_HOME=/opt/maven
ENV PATH="/opt/maven/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

COPY config/settings.xml /etc/maven/settings.xml
COPY --chmod=755 maven-entrypoint.sh /usr/local/bin/maven-entrypoint

WORKDIR ${WORKSPACE_DIR}
VOLUME ["${WORKSPACE_DIR}"]
CMD ["maven-entrypoint"]
