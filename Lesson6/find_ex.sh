#!/bin/bash

# find /usr/bin -type f -perm /a=xr -exec ls -li {} \; | awk '$1=$1' | cut -d " " -f10
# find /usr/bin -type f -perm /a=xr -exec ls -li {} \; | tr -s " " | cut -d " " -f10


find /usr/bin -type f -perm /a=xr -exec ls -li {} \+ > ./usr_executables.txt