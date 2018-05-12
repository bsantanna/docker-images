#!/usr/bin/env bash

arch="x86_64"

if [ -z $1 ]; then
    echo "Missing containers directory."
else
    echo "cd ${1}/openssh-client/arch/${arch}/ && bash docker_build.sh" | bash -x
    echo "cd ${1}/openjdk-7-jdk/arch/${arch}/ && bash docker_build.sh" | bash -x
    echo "cd ${1}/openjdk-8-jdk/arch/${arch}/ && bash docker_build.sh" | bash -x
    echo "cd ${1}/jenkins/arch/${arch}/ && bash docker_build.sh" | bash -x
    echo "cd ${1}/jenkins-docker/arch/${arch}/ && bash docker_build.sh" | bash -x
    echo "cd ${1}/frontend-dev/arch/${arch}/ && bash docker_build.sh" | bash -x
    echo "cd ${1}/frontend-build/arch/${arch}/ && bash docker_build.sh" | bash -x
    echo "cd ${1}/backend-dev/arch/${arch}/ && bash docker_build.sh" | bash -x
    echo "cd ${1}/backend-build/arch/${arch}/ && bash docker_build.sh" | bash -x
fi