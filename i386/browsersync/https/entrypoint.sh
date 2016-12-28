#!/usr/bin/env bash

node ssl_proxy.js &
node proxy.js &
node_modules/weinre/weinre --httpPort 3002 --boundHost -all-