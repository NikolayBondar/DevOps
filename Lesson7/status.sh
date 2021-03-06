#!/bin/bash

#Находим id процесса
id=$(ps -aux | grep '[a]pache2 -k start' | awk '$1=$1' | cut -d " " -f2 | head -n 1 | tr -d '/n')

# Существует ли id
if [ -z $id ]; then

echo "Proces Apache2 not found"

else
# Название приложения
  name=$(ps -aux | grep '[a]pache2 -k start' | awk '$1=$1' | cut -d " " -f11 | head -n 1)


  `systemctl stop apache2`

  echo "Process $name $id stopped"

  sleep 10

# Проверяем наличие процесса с нужным id
  n=$(ps -p $id | wc -l)

#Если процесс не остановился
  if [ "$n" -gt 1 ]	

  then
    `kill -15 $id`
  fi

fi

