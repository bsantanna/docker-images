#!/usr/bin/env bash

echo "docker pull 'bsantanna/nginx-static'" | bash -x
echo "docker build -t 'bsantanna/nginx-static-x86_64' ../.." | bash -x