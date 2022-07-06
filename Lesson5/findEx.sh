#!/bin/bash

# Два варианта решения вопроса

# find /usr -maxdepth 2 -type f -perm /a=x > exe.txt

for folder in /usr/*
do
    for file in "$folder"/*
    do
        if [ -x "$file" ] && [ -f "$file" ]; then
        echo "$file"
        fi
    done
done > ./executable.txt