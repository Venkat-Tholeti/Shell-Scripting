#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then  
  echo "ERROR: Please run this script with root access"
  exit 1 # we can give any number upto 127 other than 0 
else
  echo "You are Running with root access"
fi

#FUNCTION FOR REPEATED CODE
VALIDATE(){
    if [ $1 -eq 0 ] # We can pass arguments to function also , Here $1 is 1st argument ($?) of VALIDATE in Installed space below
  then
    echo "Installation of $2 is success" # $2 is Software mentioned as below in VALIDATE function in INSTALLED SPACE BELOW
  else
    echo "Installation of $2 is failure"
    exit 1
  fi

}

dnf list installed mysql
#This will check if already installed or not, if not it will install
if [ $? -ne 0 ]
then
  echo "Mysql is not installed, Installation will Proceed"
  dnf install mysql -y
  #This is install status after it is being installed
  VALIDATE $? "MYSQL" #here $1 = $? (1st argument) $2 = MYSQL (2nd Argument) 
else
   echo "MYSQL is already installed , Nothing to do!"


dnf list installed python3
#This will check if already installed or not, if not it will install
if [ $? -ne 0 ]
then
  echo "python3 is not installed, Installation will Proceed"
  #If  not installed proceed with installation
  dnf install python3 -y
  #This is install status after it is being installed
  VALIDATE $? "Python3" #here $1 = $? (1st argument) $2 = Python3 (2nd Argument)
 
else
   echo "Python3 is already installed , Nothing to do!"



dnf list installed nginx
#This will check if already installed or not, if not it will install
if [ $? -ne 0 ]
then
  echo "Nginx is not installed, Installation will Proceed"
  #If  not installed proceed with installation
  dnf install nginx -y
   #This is install status after it is being installed
  VALIDATE $? "Nginx" #here $1 = $? (1st argument) $2 = Nginx (2nd Argument)

else
   echo "Nginx is already installed , Nothing to do!"
fi