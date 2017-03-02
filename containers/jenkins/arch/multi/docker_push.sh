#!/usr/bin/env bash

function showHelp {
    printf "\n\t manifest-tool needs DOCKER_HUB_USERNAME and DOCKER_HUB_PASSWORD variables set... \n\n"
}

function manifestPush {
    manifest-tool \
        --username ${DOCKER_HUB_USERNAME} \
        --password ${DOCKER_HUB_PASSWORD} \
        push from-spec jenkins.yml
}

if [ -z "${DOCKER_HUB_USERNAME}" ]; then
    showHelp
elif [ -z "${DOCKER_HUB_PASSWORD}" ]; then
    showHelp
else
    manifestPush
fi


