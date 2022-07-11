#!/bin/bash
#Находим шв процесса
id=$(ps -aux | grep '[a]pache2 -k start' | awk '$1=$1' | cut -d " " -f2 | head -n 1 | tr -d '/n')
# Существует ли id
if [ -z $id ]; then

echo "Proces Apache2 not found"

else
# Bvz ghjwtccf
  name=$(ps -aux | grep '[a]pache2 -k start' | awk '$1=$1' | cut -d " " -f11 | head -n 1)

#  echo "$id"

#  echo "$name"

  `kill -15 $id`

  echo "Process $name $id stopped"

  sleep 10
# Проверяем наличие процесса с нужным id
  n=$(ps -aux | grep $id | grep -v grep | wc -l)

  if [ "$n" -gt 0 ]	

  then
    `kill -9 $id`
  fi

fi

