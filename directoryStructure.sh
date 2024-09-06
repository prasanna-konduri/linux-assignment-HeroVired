#!/bin/bash

# Script Name: directoryStructure.sh
# Description: This script is written to create a directory structure underthe  /home/user/ directory
# Author: Laxmi Prasanna
# Date: 2024-08-27

#Please specify the root location where the directories should be created.

CURRENT_PATH="$HOME" 
ROOT_DIR="$CURRENT_PATH"

# creating a array of strings to specify the directory names.

DIR_LIST=('downloads' 'documents' 'projects')

#Iterating through each name and checking if the directory exists. if not exist it will create one. 

for DIR in "${DIR_LIST[@]}"; do	
	
	DIR_NAME="$ROOT_DIR/$DIR" 

	if [ ! -d "$DIR_NAME" ] ; then
		#making the directory

		mkdir -p  $DIR_NAME

		echo "directory $DIR_NAME created"

	else

		echo "directory $DIR_NAME exists"

	fi

	if [ "$DIR" = "projects" ]; then

		i=1

		while [ $i -le 3 ]; do

			#creating the nested directory structure for projects directory 
        		mkdir -p "$DIR_NAME/project$i"

        		((i++))

		done	
	fi
done
