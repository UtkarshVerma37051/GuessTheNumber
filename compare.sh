#!/usr/bin/bash

actual_number=$1
guessed_number=$2

#Converting numbers into arrays
arr1=("${actual_number:0:1}" "${actual_number:1:1}" "${actual_number:2:1}" "${actual_number:3:1}")
arr2=("${guessed_number:0:1}" "${guessed_number:1:1}" "${guessed_number:2:1}" "${guessed_number:3:1}")


rloc=0  pos_i=0;

#To keep record of right places.
check0=("1" "1" "1" "1")

#To keep record of correct match found of right number (except those which are already at right position) in arr1 and arr2.
check1=("1" "1" "1" "1")
check2=("1" "1" "1" "1")

for i in {0..3}
do
    if [[ ${arr1[i]} == "${arr2[i]}" ]]
    then
        ((rloc++))
        ((check0[i]='0'))
    fi
done

rnum=$rloc

for i in "${arr1[@]}"
do
    pos_j=0
    for j in "${arr2[@]}"
    do
       if [[ ${check0[pos_j]} == "1" && ${check0[pos_i]} == "1" && $i == "$j" && ${check1[pos_i]} == "1" && ${check2[pos_j]} == "1" ]]
       then

            ((rnum++,check1[pos_i]='0',check2[pos_j]='0'))
       fi
       ((pos_j++))
    done
    ((pos_i++))
done