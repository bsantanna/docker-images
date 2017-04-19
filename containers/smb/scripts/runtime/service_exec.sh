#!/bin/bash

service rpcbind start
service nmbd start
service smbd start

tail -v /var/log/samba/log.smbd
