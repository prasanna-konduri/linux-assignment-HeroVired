#!/bin/bash

# Script Name: filePermission.sh
# Description: This script check for differnt file permissions and dispalys the messages respectively.
# Variables:
# FILE stores the input text file. 

# prompt the user to enter a file path
read -p "please enter a file path to check permissions": FILE

#checks if the file path exists. if not exist then exits the script.
if [ ! -e "$FILE" ]; then

	echo "File does not exist!!"
	exit 1

fi

#checks if the given path is a file or directory. if directory then exits
if [ -d "$FILE" ]; then

       	echo "The given path is a directory. Please enter a file path!"
	exit 1

fi

#check for read permission
if [ -r "$FILE" ]; then

	echo "file is readable!"
else
	echo "File is not readable!"
fi

#check for write permission
if [ -w "$FILE" ]; then

        echo "file is writable!"
else
        echo "File is not writable!"

fi

#check for executable permission
if [ -x "$FILE" ]; then

        echo "file is executable!"
else
        echo "File is not executable!"

fi
