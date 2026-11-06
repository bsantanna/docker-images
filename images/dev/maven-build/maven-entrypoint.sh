#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -eq 0 ]; then
    set -- clean install
fi

exec mvn -T "${MAVEN_THREAD_COUNT}" ${JAVA_OPTS:-} --settings /etc/maven/settings.xml "$@"
