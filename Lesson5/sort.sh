#!/bin/bash

# Only directory "log"
find /var/log -maxdepth 1 -type f -exec ls -l {} \+ | sort -nk5 | tr -s " " | cut -d " " -f9 > log.txt

# Includes subdir
find /var/log -type f -exec ls -l {} \+ | sort -nk5 | tr -s " " | cut -d " " -f9 > logR.txt