#!/usr/bin/bash

#Generating a random 4-digit number
actualnumber=$(($((RANDOM%9000))+1000))
echo -en "_ _ _ _\033[7D"
var=0 pos=1 i=1
while true
do
	#Stop to take input if the 4th number is entered.
	if [ $pos -eq 5 ] && [ ${#input[@]} -eq 4 ]
	then
		break
	fi
	read -sr -n1 var
	case $var in
	a|A)
		#Moving cursor to left on pressing a/A.
		echo -en "\033[2D"

		#Not moving cursor if already at starting position.
		if [ $pos -ge 2 ]
		then
			((pos--))
		fi;;
	d|D)
		#Moving cursor to right (only till last entered number)	on pressing d/D.
		if [ $pos -le ${#input[@]} ]
		then
			echo -en "\033[2C"
			((pos++))
		fi;;
	[0-9])
		echo -n "$var "

		#Storing the input in an array.
		input[$pos]=$var
		((pos++))
	esac
	((i++))
done

#Converting the array into actual number.
guessednumber=$(IFS=$'\0';echo "${input[*]}")
if [ $actualnumber -eq "$guessednumber" ]; then
	echo -e "\nSuccess!!!"
else
	echo -e "\nFail!!!"
fi