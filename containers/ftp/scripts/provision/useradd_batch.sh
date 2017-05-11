#!/bin/bash

for line in `cat /config/users.txt`
do
  USERNAME=`echo $line | cut -f1 -d:`
  useradd -d /srv/ftp -s /bin/bash ${USERNAME}
  echo ${USERNAME} >> /etc/vsftpd.userlist
done
