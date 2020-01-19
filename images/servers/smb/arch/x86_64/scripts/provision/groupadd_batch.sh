#!/usr/bin/env bash

for line in `cat /config/users.txt`
do
  username=`echo ${line} | cut -f1 -d:`
  groupname=`echo ${line} | cut -f4 -d:`
  groupid=`echo ${line} | cut -f5 -d:`

  bash -x -c "groupadd ${groupname} --gid ${groupid}" || true
  bash -x -c "usermod -aG ${groupname} ${username}"
done
