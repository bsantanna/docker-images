#!/usr/bin/env bash

echo "docker pull 'bsantanna/docker-manifest-publisher'" | bash -x
echo "docker build -t 'bsantanna/docker-manifest-publisher-x86_64' ../.." | bash -x