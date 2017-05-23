#!/bin/bash

mkdir -p "/run/sendsigs.omit.d/rpcbind"
service rpcbind start

service nmbd start

service smbd start

sleep infinity
