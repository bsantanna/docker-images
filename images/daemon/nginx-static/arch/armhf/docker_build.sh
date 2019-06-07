#!/usr/bin/env bash

echo "docker pull 'bsantanna/nginx-static:armhf'" | bash -x
echo "docker build -t 'bsantanna/nginx-static:armhf' ../.." | bash -x