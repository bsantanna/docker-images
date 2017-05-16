#!/bin/bash

mkdir -p "/run/sendsigs.omit.d/rpcbind"

service rpcbind start

unfsd -d
