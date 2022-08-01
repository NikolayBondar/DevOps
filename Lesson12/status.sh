#!/bin/bash

id=$(systemctl status apache2 | grep PID | tr -s ' ' | cut -d ' ' -f4 | tr -d '/n')
stat=$(systemctl status apache2| grep Active | tr -s " " | cut -d ' ' -f 3)

name=$(systemctl status apache2 | grep 'apache2.service -' | tr -s ' ' | cut -d '-' -f2)

if [ -z $id ] || [ $stat == "inactive" ]
then
  echo "Process not found or Inactive"
else

  `systemctl stop apache2`

  echo "Process $name $id stopped"

  sleep 10

  n=$(ps -p $id | wc -l)


  if [ "$n" -eq 1 ]	

  then
    `systemctl start apache2`    
  fi

id=$(systemctl status apache2 | grep PID | tr -s ' ' | cut -d ' ' -f4 | tr -d '/n')
stat=$(systemctl status apache2| grep Active | tr -s " " | cut -d ' ' -f 3)
if [ -z $id ] || [ $stat == "inactive" ]
then
  echo "Process not found or Inactive"
else

fi 

