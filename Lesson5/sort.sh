#!/bin/bash

# Only directory "log"
# find /var/log/ -maxdepth 1 -type f -exec ls -la {} \; | sort -nk5 | cut -d " " -f5,9 > ./log.txt

# Includes subdir
#find /var/log -type f -exec ls -la {} \; | sort -nk5 | cut -d " " -f5,9 > ./logR.txt

# В некоторых случаях предыдущий вариант некорректно отрабатывал по причине того что разделитель колонок (пробел), 
# в некоторых строках оказывался двойным, функция некорректно разбивала на колонки, вышел из ситуации так:
find /var/log -maxdepth 1 -type f -exec ls -l {} \+ | sort -nk5 | cut -b 47- >log.txt