#!/bin/bash

id=$(systemctl status apache2 | grep PID | tr -s ' ' | cut -d ' ' -f4)

name=$(systemctl status apache2 | grep 'apache2.service -' | tr -s ' ' | cut -d '-' -f2)

if [ -z $id ] 
then

  `kill -15 $id`

  echo "Process $name $id stopped"

  sleep 10

  n=$(ps -aux | grep $id | grep -v grep | wc -l)

  echo "$n"

  if [ "$n" -gt 0 ]	

  then

    `kill -9 $id`
  fi
else echo "Process not found"
fi 


