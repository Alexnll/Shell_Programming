#! /usr/bin/bash

os=('ubuntu' 'windows' 'kali')
os[3]='mac'     # add elements to the array
os[0]='OS' # update the array
echo "${os[@]}" # print all elements
echo "${os[1]}" # print the second element
echo "${!os[@]}" # print the indexes of the array
echo "${#os[@]}" #print the length of the array
unset os[2]    # remove element in array
echo "${os[@]}"
os[6]='crea' # out of range, position is igonred
echo "${#os[@]}"
echo "${os[@]}"

string=dasdasasdasd # take string as array
echo "${string[@]}"
echo "${#string[@]}" # only one element in the array