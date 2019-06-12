#!/bin/bash

mkdir -p "/run/sendsigs.omit.d/rpcbind"

/etc/init.d/rpcbind start

unfsd -d
