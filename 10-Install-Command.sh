#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then  
  echo "ERROR: Please run this script with root access"
  exit 1 # we can give any number upto 127 other than 0 
else
  echo "You are Running with root access"
fi

dnf list installed mysql
#This will check if already installed or not, if not it will install
if [ $? -ne 0 ]
then
  echo "Mysql is not installed, Installation will Proceed"
  #If  not installed proceed with installation
  dnf install mysql -y
  #This is install status after it is being installed
  if [ $? -eq 0 ] 
  then
    echo "Installation of Mysql is success"
  else
    echo "Installation of Mysql is failure"
    exit 1
  fi

else
   echo "Mysql is already installed , Nothing to do!"
fi


# dnf install mysql -y 

# if [ $? -eq 0 ]
# then
#   echo "Installing Mysql is Success"
# else
#   echo "Installing Mysql is failure"
#   exit 1
# fi