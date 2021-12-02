#!/usr/bin/bash
source "start_view.sh"
#Generating a random 4-digit number
clear
actualnumber=$(($((RANDOM%9000))+1000))
sno=1
echo -e "\n\n\n\nS.No.\t\tNumber\t\t\tRight no.\t\t\tRight location\t\t\tStatus"
while true
do
	echo -en "\n$sno\t\t_ _ _ _\033[7D"
	var=0 pos=1 i=1 rno=0 rloc=0
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

			#Not moving cursor if already at starting position.
			if [ $pos -ge 2 ]
			then
				echo -en "\033[2D"
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
	echo -en "\t\t$rno\t\t\t\t$rloc\t\t\t\t"
	# echo -en "\033[A"
	guessednumber=$(IFS=$'\0';echo "${input[*]}")
	if [[ $actualnumber -eq "$guessednumber" ]]; then
		echo -e "\033[1;32mSuccess\033[0m\n\n\nYou found in \033[1;32m$sno\033[0m attempts!!!"
		exit 0
	else
		echo -e "\033[1;31mFail\033[0m"
	fi
	((++sno))
	input=()
	((pos=1,i=1))
done