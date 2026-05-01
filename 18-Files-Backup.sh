#!/bin/bash

SOURCE_DIRECTORY=$1
DESTINATION_DIRECTORY=$2
DAYS=${3:-14} #if days are provided argument is considered, or else by default 14 days

mkdir -p $DESTINATION_DIRECTORY  #IF NOT PRESENT, IT WILL CREATE, IF PRESENT IT WILL IGNORE

find $SOURCE_DIRECTORY -type f -mtime $DAYS -exec cp {} $DESTINATION_DIRECTORY \; #{} this means current file

echo "Backup Completed Successfully"