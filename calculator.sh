#!/bin/bash

# Script Name: calculator.sh
# Description: This script performs a simple calculator orerations based on the user input.
# Author: Laxmi Prasanna
# variables : 
# NUM1 store the value of one number.
# NUM1 store the value of another number.
# OP is the operation that has to be perforemed with the two given numbers.

# prompting the user to enter a number
read -p "Enter number 1": NUM1

# prompting the user to enter second number
read -p "Enter number 2": NUM2

# prompting the user to enter an operation to perform on the two numbers
read -p "Enter the operation (+,-,*,/) to perform": OP

#using case to perform the operations based on the user input
case $OP in
        +) echo "$NUM1 + $NUM2 = $(($NUM1 + $NUM2))" ;;
        -) echo "$NUM1 - $NUM2 = $(($NUM1 - $NUM2))" ;;
        \*) echo "$NUM1 * $NUM2 = $(($NUM1 * $NUM2))" ;;
        /) 
            #checks if the number entered is zero. 
            #Prints a message if it is zero else performs the operation. 
            if [ "$NUM2" -eq 0 ]; then
                echo "Error: Division by zero is not allowed."
            else
                echo "$NUM1 / $NUM2 = $(($NUM1 / $NUM2))"
            fi
            ;;
        *) echo "Invalid operation" ;;  #displays the message if the operation is other than the given options.
    esac
