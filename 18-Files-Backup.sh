#!/bin/bash

SOURCE_DIRECTORY="/home/ec2-user/Shell-Scripting/apps/logs/"
DESTINATION_DIRECTORY="/home/ec2-user/Shell-Scripting/backup/logs"
DAYS=${1:-14} #if days are provided in 1stargument it is considered, or else by default 14 days

mkdir -p $DESTINATION_DIRECTORY  #IF NOT PRESENT, IT WILL CREATE, IF PRESENT IT WILL IGNORE

find $SOURCE_DIRECTORY -type f -mtime +$DAYS -exec cp {} $DESTINATION_DIRECTORY \; #{} this means current file

echo "Backup Completed Successfully"

# IF WE NEED TO TAR THE FILES THEN 

SOURCE_DIRECTORY="/home/ec2-user/Shell-Scripting/apps/logs/"
DESTINATION_DIRECTORY="/home/ec2-user/Shell-Scripting/backup/logs"
DAYS=${1:-14}
DATE=$(date +%F)

mkdir -p $DESTINATION_DIRECTORY  #IF NOT PRESENT, IT WILL CREATE, IF PRESENT IT WILL IGNORE

find $SOURCE_DIRECTORY -type f -mtime +$DAYS | tar -czf $DESTINATION_DIRECTORY/backup_$DATE.tar.gz -T -

echo "Zipping  Completed Successfully"

echo "files archived are"
tar -tzf $DESTINATION_DIRECTORY/backup_$DATE.tar.gz | tee
# To check files are there in tar.gz


#HERE -T - means it will take input from find

# to check files are there in tar.gz
#tar -tzf backup_2026-05-01.tar.gz