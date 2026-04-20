#!/bin/bash

echo -e  "\e[31m Arey nenu Red ni Ra"
echo -e  "\e[32m Arey nenu Green ni Ra \e[0m"

#VARIABLES
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "nginx" "python" "httpd")

mkdir -p $LOGS_FOLDER

echo -e "$G Script Started Executing At $(date) $N" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then  
  echo -e  "$R ERROR: Please run this script with root access $N" | tee -a $LOG_FILE
  exit 1 # we can give any number upto 127 other than 0 
else
  echo -e  "$G You are Running with root access $N" | tee -a $LOG_FILE
fi

#FUNCTION FOR REPEATED CODE
VALIDATE(){
    if [ $1 -eq 0 ] # We can pass arguments to function also , Here $1 is 1st argument ($?) of VALIDATE in Installed space below
  then
    echo -e   "$G Installation of $2 is success $N" | tee -a $LOG_FILE # $2 is Software mentioned as below in VALIDATE function in INSTALLED SPACE BELOW
  else
    echo -e  "$R Installation of $2 is failure $N" | tee -a $LOG_FILE
    exit 1
  fi

}

for package in ${PACKAGES[@]}
do 
  dnf list installed $package
#This will check if already installed or not, if not it will install
if [ $? -ne 0 ]
then
  echo -e "$Y $package is not installed, Installation will Proceed $N" | tee -a $LOG_FILE
  dnf install $package -y
  #This is install status after it is being installed
  VALIDATE $? $package #here $1 = $? (1st argument) $2 = MYSQL (2nd Argument) 
else
   echo -e "$N $package is already installed , Nothing to do! $N" | tee -a $LOG_FILE
fi
done
