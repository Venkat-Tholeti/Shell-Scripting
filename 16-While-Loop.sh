#!/bin/bash

i=1

while [ $i -le 5 ]
do 
  echo $i
  i=$((i+1))
done

while read line
do 
  echo $line
done < file.txt 

