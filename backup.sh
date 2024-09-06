#!/bin/bash

# Script Name: backup.sh
# Description: This script will take a backup of all the text files of a given directory.
# moves the text files to a backup directory with timestamp attached.
# Author: Laxmi Prasanna
# variables : 
# DIR is the source directory.
# FILE_PATH is the absolute file path.
# FILE_NAME is the basename of the file name.
# NEW_FILE_NAME is the file name attached with timestamp.

read -p "please enter the directory name:" DIR

#creates directory backup if not exist
mkdir -p ./backup

#iterates through the files in the directory with `.txt` extension 
for FILE_PATH in "$DIR"/*.txt;  do
	
	#get the base name from the file path
	FILE_NAME=$(basename "$FILE_PATH")
 
	#getting the timestamp
	DATE=$(date +%s)

	#creating the file name with attached timestamp
	NEW_FILE_NAME="${FILE_NAME%.txt}_${DATE}.${FILE_NAME#*.}"
	
	#copying the file to backup folder
	cp $FILE_PATH ./backup/$NEW_FILE_NAME
done
