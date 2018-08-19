#!/usr/bin/env bash

function showHelpEnv {
    printf "\n\t manifest-tool needs DOCKER_REGISTRY_USERNAME and DOCKER_REGISTRY_PASSWORD variables set... \n\n"
}

function showHelpArgs {
    printf "Missing manifest file argument. \n\n\t Usage: $0 manifest-file.yml\n\n"
}

function manifestPush {
    manifest-tool \
        --username ${DOCKER_REGISTRY_USERNAME} \
        --password ${DOCKER_REGISTRY_PASSWORD} \
        push from-spec "${1}"
}

if [ -z "${DOCKER_REGISTRY_USERNAME}" ]; then
    showHelpEnv
elif [ -z "${DOCKER_REGISTRY_PASSWORD}" ]; then
    showHelpEnv
elif [ -z "${1}" ]; then
    showHelpArgs
else
    manifestPush $*
fi
