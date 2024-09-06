#!/bin/bash

# Script Name: userInfo.sh
# Description: This script dispalys the complete user information includes 
# user name, user id, group id, path to the home directory and default shell used.
# Variables:
# USER system variable for user name . 
# UID system variable for user id . 
# GID  variable for group id . 
# HOME system variable for use home path . 
# SHELL system variable for default shell . 

GID="$(id -g)" 
echo "User name : $USER"
echo "User name ID (UID) : $UID"
echo  "Group ID: $GID"
echo  "Home directory : $HOME"
echo  "default shell: $SHELL"
