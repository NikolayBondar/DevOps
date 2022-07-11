#!/bin/bash

id=$(systemctl status apache2 | grep PID | tr -s ' ' | cut -d ' ' -f4 | tr -d '/n')
stat=$(systemctl status apache2| grep Active | tr -s " " | cut -d ' ' -f 3)

name=$(systemctl status apache2 | grep 'apache2.service -' | tr -s ' ' | cut -d '-' -f2)

if [ -z $id ] || [ $stat == "inactive" ]
then
  echo "Process not found or Inactive"
else

  `kill -15 $id`

  echo "Process $name $id stopped"

  sleep 10

  n=$(ps -aux | grep $id | grep -v grep | wc -l)

  if [ "$n" -gt 0 ]	

  then

    `kill -9 $id`
  fi
fi 


