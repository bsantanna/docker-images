#!/usr/bin/env bash

echo "docker pull 'bsantanna/nginx-static:x86_64'" | bash -x
echo "docker build -t 'bsantanna/nginx-static:x86_64' ../.." | bash -x