#!/usr/bin/env bash

echo "mvn -T ${MAVEN_THREAD_COUNT} ${JAVA_OPTS} --settings /etc/maven/settings.xml clean install"| bash -x
