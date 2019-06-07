#!/usr/bin/env bash

echo "docker pull 'bsantanna/jenkins:x86_64'" | bash -x
echo "docker build -t 'bsantanna/jenkins:x86_64' ../.." | bash -x