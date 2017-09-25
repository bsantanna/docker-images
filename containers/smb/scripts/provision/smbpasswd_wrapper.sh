#!/usr//bin/expect --
# wrapper to make passwd(1) be non-interactive
# username is passed as 1st arg, passwd as 2nd
# Executable only by root

set password [lindex ${argv} 1]
spawn /usr/bin/smbpasswd -a [lindex ${argv} 0]
expect "password:"
send "${password}\r"
expect "password:"
send "${password}\r"
expect eof
