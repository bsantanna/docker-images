#!/usr/bin/env bash

for line in `cat /config/users.txt`
do
  username=`echo ${line} | cut -f1 -d:`
  groupname=`echo ${line} | cut -f3 -d:`

  groupadd ${groupname} || true
  usermod -aG ${groupname} ${username}
done
