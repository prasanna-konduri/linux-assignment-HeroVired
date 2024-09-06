#!/bin/bash

# Script Name: ProcessChecker.sh
# Description: This script checks if the given prompt is running or not. if it is nor running the start the service.
# Variables:
# PROCESS_NAME stores the input process name enterd by the user. 
# HOME system variable stores the home path of the user.


# getting process name to check 
read -p "please enter a process name to check": PROCESS_NAME

#log file to log the events of the process
LOGFILE="$HOME/logs/process_checker.log"

#creating logs directory if not exist
mkdir -p $HOME/logs

#Check if the service is running
if ps aux | grep -v grep | grep -q "$PROCESS_NAME"; then
	# log the status of the file
	echo "$(date +%Y/%m/%d\ %H:%M:%S) Status of the process $PROCESS_NAME is running." >> $LOGFILE
else
	
  	echo "$(date +%Y/%m/%d\ %H:%M:%S) Status of the process $PROCESS_NAME is not running.Trying to start..." >> $LOGFILE
 	
	# Starting the service
	brew services start "$PROCESS_NAME"
	
	# Again check if the process started successfully. stores the respective message in the log
  	if ps aux | grep -v grep | grep -q "$PROCESS_NAME"; then

    		echo "$(date +%Y/%m/%d\ %H:%M:%S) Status of the process $PROCESS_NAME is running." >> $LOGFILE
  	else
    		echo "$(date +%Y/%m/%d\ %H:%M:%S) Falied to start the process $PROCESS_NAME" >> $LOGIFILE  
  	fi
fi

