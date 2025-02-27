FROM apache/airflow:latest
LABEL org.opencontainers.image.authors="bruno@btech.software"
ENV REFRESHED_AT=2025-02-27

USER root

RUN apt update -qq && \
    apt install -yqq --no-install-recommends git && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /tmp/ &&  echo test-0227e &&\
    git clone https://github.com/bsantanna/agent-lab.git && \
    cd /tmp/agent-lab && git checkout feat/airflow-etl-3 && chown airflow:root /tmp/agent-lab/ && \
    cp -a /tmp/agent-lab/dags ${AIRFLOW_HOME}/dags/

USER airflow
