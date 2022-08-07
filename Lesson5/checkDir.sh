#!/bin/bash
# Два варианта решения вопроса
# find /etc/ -maxdepth 1 -type d > ./etc_dir.txt

for item in /etc/*
do
    if [ -d "$item" ]; then
    echo "$item"
    fi
done > ./etc_dir.txt