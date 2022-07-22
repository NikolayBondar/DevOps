#!/bin/bash
c=$(wc -l usr_executables.txt | cut -d " " -f1)
echo "Number of lines in the file: $c"

# ---------------- Можно так -----------------

head usr_executables.txt | cut -d "/" -f4  > cmd_names.txt

# -------------- Или так, вручную -----------------

if [ -e ./cmd_names1.txt ] 
then
  rm -f ./cmd_names1.txt
fi

i=1

while IFS= read -r line
  do    
    if [[ $i -le 10 ]]
    then
      i=1+$i
      echo "$line" | cut -d "/" -f4 >> cmd_names1.txt
      else break
    fi
done < usr_executables.txt

