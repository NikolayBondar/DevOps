#!/bin/bash

id=$(ps -aux | grep '[a]pache2 -k start' | awk '$1=$1' | cut -d " " -f2 | head -n 1 | tr -d '/n')

name=$(ps -aux | grep '[a]pache2 -k start' | awk '$1=$1' | cut -d " " -f11 | head -n 1)

if [ -z $id ]; then
  
  echo "Process not found"

else
	
  `kill -20 $id`

  echo "process $name $id suspended"

  sleep 30

fi

