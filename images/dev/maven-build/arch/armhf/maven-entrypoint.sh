#!/usr/bin/env bash

echo "mvn ${JAVA_OPTS} --settings  /etc/maven/settings.xml clean install deploy"| bash -x
