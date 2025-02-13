FROM apache/airflow:latest

USER root

RUN apt update -qq && \
    apt install -yqq --no-install-recommends git && \
    cd /tmp/ && git clone https://github.com/bsantanna/agent-lab.git && \
    chown airflow:root /tmp/agent-lab/ && cp -a /tmp/agent-lab/dags ${AIRFLOW_HOME}/dags/ && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER airflow
