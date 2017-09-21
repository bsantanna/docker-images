#!/bin/bash

for line in `cat /config/users.txt`
do
  username=`echo ${line} | cut -f1 -d:`
  password=`echo ${line} | cut -f2 -d:`
  echo ${username}:${password} | chpasswd
done

