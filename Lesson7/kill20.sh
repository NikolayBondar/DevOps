#!/bin/bash

id=$(ps -aux | grep 'apache2 -k start' | awk '$1=$1' | cut -d " " -f2 | head -n 1)

name=$(ps -aux | grep 'apache2 -k start' | awk '$1=$1' | cut -d " " -f11 | head -n 1)

echo "$id"

`kill -20 $id`

echo "process $name $id suspended"

sleep 30
