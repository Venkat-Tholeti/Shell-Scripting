#!/bin/bash

echo -e  "\e[31m Arey nenu Red ni Ra"
echo -e  "\e[32m Arey nenu Green ni Ra \e[0m"

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then  
  echo -e  "$R ERROR: Please run this script with root access $N"
  exit 1 # we can give any number upto 127 other than 0 
else
  echo -e  "$G You are Running with root access $N"
fi

#FUNCTION FOR REPEATED CODE
VALIDATE(){
    if [ $1 -eq 0 ] # We can pass arguments to function also , Here $1 is 1st argument ($?) of VALIDATE in Installed space below
  then
    echo -e   "$G Installation of $2 is success $N" # $2 is Software mentioned as below in VALIDATE function in INSTALLED SPACE BELOW
  else
    echo -e  "$R Installation of $2 is failure $N"
    exit 1
  fi

}


dnf list installed mysql
#This will check if already installed or not, if not it will install
if [ $? -ne 0 ]
then
  echo -e "$Y Mysql is not installed, Installation will Proceed $N"
  dnf install mysql -y
  #This is install status after it is being installed
  VALIDATE $? "MYSQL" #here $1 = $? (1st argument) $2 = MYSQL (2nd Argument) 
else
   echo -e "$N MYSQL is already installed , Nothing to do! $N"


   dnf list installed python3
#This will check if already installed or not, if not it will install
if [ $? -ne 0 ]
then
  echo -e "$Y python3 is not installed, Installation will Proceed $N"
  #If  not installed proceed with installation
  dnf install python3 -y
  #This is install status after it is being installed
  VALIDATE $? "Python3" #here $1 = $? (1st argument) $2 = Python3 (2nd Argument)
 
else
   echo -e "$N Python3 is already installed , Nothing to do! $N"



   dnf list installed nginx
#This will check if already installed or not, if not it will install
if [ $? -ne 0 ]
then
  echo -e "$Y Nginx is not installed, Installation will Proceed $N"
  #If  not installed proceed with installation
  dnf install nginx -y
   #This is install status after it is being installed
  VALIDATE $? "Nginx" #here $1 = $? (1st argument) $2 = Nginx (2nd Argument)

else
   echo -e "$N Nginx is already installed , Nothing to do! $N"
fi