#!/usr/bin/env bash

echo "docker pull 'bsantanna/chromium-kiosk'" | bash -x
echo "docker build -t 'bsantanna/chromium-kiosk-x86_64 ../..'" | bash -x