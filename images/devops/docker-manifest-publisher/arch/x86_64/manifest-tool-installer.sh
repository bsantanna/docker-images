#!/usr/bin/env bash

export GOPATH="/opt/go"
export GIT_UPSTREAM_USER="estesp"
export GIT_UPSTREAM_REPOSITORY="https://github.com/estesp/manifest-tool"

function makeBuild {
    cd ${GOPATH}/src

    if [ ! -d "github.com/${GIT_UPSTREAM_USER}" ]; then
        echo "mkdir -p \"github.com/${GIT_UPSTREAM_USER}\"" | bash -x
    fi

    cd "github.com/${GIT_UPSTREAM_USER}"

    if [ ! -d "manifest-tool" ]; then
        echo "git clone \"${GIT_UPSTREAM_REPOSITORY}\"" | bash -x
    else
        echo "git pull" | bash -x
    fi

    echo "cd manifest-tool && make binary && make install" | bash -x
}

if [ -d "${GOPATH}/src" ]; then
    makeBuild
    echo "rm -fr ${GOPATH}" | bash -x
else
    echo "mkdir -p \"${GOPATH}/src\"" | bash -x
    makeBuild
    echo "rm -fr ${GOPATH}" | bash -x
fi
