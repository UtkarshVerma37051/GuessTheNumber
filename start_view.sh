#!/usr/bin/bash

#This script is for the Start View of the Game.

lines=$(tput lines)
cols=$(tput cols)
((lines=lines/2,cols=cols/2))

#Function to print a custom message 'n' number of times
#First  Parameter : Number of times (n) a message to be printed.
#Second Parameter : Message to be printed.
function custom_message(){
    for ((i=0;i<$1;i++))
    do
        echo -en "$2"
    done
}
clear
custom_message lines "\n"
custom_message cols-16 " "
echo "--------------------------------"
custom_message cols-16 " "
echo "Welcome to Guess The Number Game"
custom_message cols-16 " "
echo "--------------------------------"
custom_message lines-1 "\n"
echo  -en "\033[5mPress any key to start...\033[0m"
read -r