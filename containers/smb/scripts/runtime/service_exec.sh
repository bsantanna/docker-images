#!/bin/bash

service rpcbind start
service nmbd start
service smbd start

watch "cat /var/log/samba/log.smbd | tail"
