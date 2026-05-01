#!/bin/bash

SOURCE_DIRECTORY="/home/ec2-user/Shell-Scripting/apps/logs/"
DESTINATION_DIRECTORY="/home/ec2-user/Shell-Scripting/backup/logs"
#DAYS=${3:-14} #if days are provided argument is considered, or else by default 14 days

mkdir -p $DESTINATION_DIRECTORY  #IF NOT PRESENT, IT WILL CREATE, IF PRESENT IT WILL IGNORE

find $SOURCE_DIRECTORY -type f -mtime +14 -exec cp {} $DESTINATION_DIRECTORY \; #{} this means current file

echo "Backup Completed Successfully"

# IF WE NEED TO TAR THE FILES THEN 

SOURCE_DIRECTORY="/home/ec2-user/Shell-Scripting/apps/logs/"
DESTINATION_DIRECTORY="/home/ec2-user/Shell-Scripting/backup/logs"
DATE=$(date +%F)

mkdir -p $DESTINATION_DIRECTORY  #IF NOT PRESENT, IT WILL CREATE, IF PRESENT IT WILL IGNORE

find $SOURCE_DIRECTORY -type f -mtime +14 | tar -czf $DESTINATION_DIRECTORY/backup_$DATE.tar.gz -T -

echo "Zipping  Completed Successfully"

#HERE -T - means it will take input from find

# to check files are there in tar.gz
#tar -tzf backup_2026-05-01.tar.gz