#!/usr/bin/env bash


echo "docker pull 'bsantanna/elastic-apm-agent:x86_64'" | bash -x
echo "docker build -t 'bsantanna/elastic-apm-agent:x86_64' ../.." | bash -x