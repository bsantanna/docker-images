#!/usr/bin/env bash

echo "docker pull 'bsantanna/chef-dev'" | bash -x
echo "docker build -t 'bsantanna/chef-dev-x86_64' ../.." | bash -x