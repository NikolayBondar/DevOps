#!/bin/bash
find /usr/bin -type f -perm /a=xr -exec ls -li {} \+ > ./usr_executables.txt
