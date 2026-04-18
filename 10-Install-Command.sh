#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then  
  echo "ERROR: Please run this script with root access"
  exit 1 # we can give any number upto 127 other than 0 
else
  echo "You are Running with root access"
fi

dnf install mysql -y 