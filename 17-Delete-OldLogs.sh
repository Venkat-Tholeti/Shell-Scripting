#!/bin/bash

SOURCE_DIRECTORY=/home/ec2-user/Shell-Scripting/apps/logs
Files_TO_DELETE=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

while read line
do
    rm -rf $line
    echo "$line Files Deleted "
done <<< $Files_TO_DELETE  

#FOR INPUT IS FROM FILE OUTSIDE WE WILL GIVE < , BUT INPUT FROM WITHIN SCRIPT <<<


