#!/bin/bash

# Script Name: automatedBackup.sh
# Description: This script will create a tar file of /home/user/Documents folder.
# creates a backup folder if not exist and saves the tar file in the backup folder.
# Author: Laxmi Prasanna
# variables : 
# SOURCE_DIR is the source directory.
# BACKUP_DIR is the backup directory.
# DESTINATION_ARCHIVE is the tar file name which will be stored in backup folder.

#specify the source document.
SOURCE_DIR="$HOME/Documents"

#backup folder location.
BACKUP_DIR="./backup"

#Desitination tar file name. 
DESTINATION_ARCHIVE="$BACKUP_DIR/documents_backup_$(date +%s).tar.gz"

#create backup directory if not exist.
mkdir -p "$BACKUP_DIR"

#creating a tar file and moving it to the destination.
tar -czvf "$DESTINATION_ARCHIVE" "$SOURCE_DIR"

#displays a message once the backup is completed.
echo "Backup complete: $DESTINATION_ARCHIVE"
