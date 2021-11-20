#!/usr/bin/bash

var=0
# echo -n "_ _ _ _"
echo -en "_ _ _ _\033[7D"
pos=1
i=1
while [[ true ]]
do
	if [ $pos -eq 5 ] && [ ${#arr[@]} -eq 4 ]
	then
		break
	fi
	read -sn1 var
	case $var in
	a|A)
		echo -en "\033[2D"
		if [ $pos -ge 2 ]
		then 
			let pos=pos-1;
		fi;;
	d|D)
		if [ $pos -le ${#arr[@]} ]
		then
			echo -en "\033[2C"
			let pos=pos+1;
		fi
		;;
	[0-9])
		echo -n "$var "
		arr[$pos]=$var
		let pos=pos+1;
	esac
	let i=i+1
done

echo -e "\nArray : ${arr[@]}"