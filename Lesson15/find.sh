#!/bin/bash
find /usr/bin -type f -perm /a=xr -exec ls -li {} \+ > ./usr_executables.txt
#`systemctl enable jenkins`
#`systemctl start jenkins`
ps -aux | grep jenkins > ./jenkins.txt