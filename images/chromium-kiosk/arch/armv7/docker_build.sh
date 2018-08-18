#!/usr/bin/env bash

docker pull "bsantanna/chromium-kiosk-armv7"
docker build -t "bsantanna/chromium-kiosk-armv7" ../..