FROM apache/airflow:latest
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2025-03-11

USER root

RUN apt update -qq && \
    apt install -yqq --no-install-recommends git && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /tmp/ && \
    git clone https://github.com/bsantanna/agent-lab.git && \
    cd /tmp/agent-lab && chown airflow:root /tmp/agent-lab/ && \
    cp -a /tmp/agent-lab/dags ${AIRFLOW_HOME}/dags/

USER airflow
