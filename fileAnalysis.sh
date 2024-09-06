#!/bin/bash

# Script Name: fileAnalysis.sh
# Description: This script analyses a text file and calculates the no of lines,
# number of words and number of charectors.
# Variables:
# FILE stores the input text file. 
# LINES Specifies the threshold when the usage is critical
# WORDS store the disc usage by performing df command.
# CHARS stores the admin email from the user input 

#prompting the user to enter a text file name.
read -p "Please enter a text file to analyse": FILE

# check if the given input is a file
if [[ -f "$FILE" ]]; then
  
  #cal culates the number of lines, words, charectors using wc command.
  LINES=$(wc -l < "$FILE")
  WORDS=$(wc -w < "$FILE")
  CHARS=$(wc -m < "$FILE")

  #dispalying the results to the user
  echo "file name: $FILE"
  echo "Number of lines in the file:$LINES"
  echo "Number of words in the file:$WORDS"
  echo "Number of charectors in the file:$CHARS"

else
  # displays when the enterd path is not a file.
  echo "$FILE is not a file.Please enter a file to analyse!"
fi
