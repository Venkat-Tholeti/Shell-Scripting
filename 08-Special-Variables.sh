#!/bin/bash

echo "Script name is $0"
echo "Number of arguments passed $#"
echo "PID of the script is $$"
echo "Arguments passed are $@"
echo "Status of last command is $?"
sleep 10 &
echo "PID of the last command running in background is $!"
echo "Present Directory $PWD"
echo "Home Directory $HOME"
echo "User Running the Script is $USER"
echo "Script Executed at $(date)"