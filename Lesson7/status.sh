#!/bin/bash

id=$(ps -aux | grep 'apache2 -k start' | awk '$1=$1' | cut -d " " -f2 | head -n 1)

name=$(ps -aux | grep 'apache2 -k start' | awk '$1=$1' | cut -d " " -f11 | head -n 1)

`kill -15 $id`

echo "Process $name $id stopped"

sleep 10

n=$(ps -aux | grep $id | grep -v grep | wc -l)

echo "$n"

if [ "$n" -gt 0 ]	

then

  `kill -9 $id`
fi

