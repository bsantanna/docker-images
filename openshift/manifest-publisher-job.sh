#!/usr/bin/env bash

for manifest in $(ls /opt/workspace/*.yml)
do
  echo "Publishing Manifest: ${manifest}"
  /opt/docker-manifest-publisher/manifest-publish.sh ${manifest}
done
