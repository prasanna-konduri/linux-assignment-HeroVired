#!/bin/bash

# Script Name: discUsage.sh
# Description: This script checks for the disc usage nad send a mail to the admin if the usage is more than 80%.
# Variables: 
# LIMIT Specifies the threshold when the usage is critical
# USAGE store the disc usage by performing df command.
# ADMIN_EMAIL stores the admin email from the user input 

#Treshold of usage
LIMIT=80

#prompting to enter the admin email address.
read -p  "Please enter admin mail adderess": ADMIN_EMAIL

#Performs df to check for the freespace and there by evaluate the disc usage.
USAGE=$(df -h / | awk 'NR==2 {print $5}'|sed 's/%//g')

#checks if the tusage exceeds threshold limit
if [ $USAGE -ge $LIMIT ]; then
	
	# composing the email 
	SUBJECT="Higher Disc usage alert!!!"
	BODY="Hello Admin, the root file system usage is $USAGE %."
	echo $BODY 
	
	# Sending the email
	echo "$BODY" | mail -s "$SUBJECT" "$ADMIN_EMAIL"
else

	#displays the usage vale if it is within the treshold limit.
	echo "the root file system disc usage is $USAGE"
fi
