#! /usr/bin/bash

count=10

if [ $count -eq 0 ]
then
	echo "count equal to 0"
elif (($count > 9))
then
	echo "count is larger than 9"
else
	echo "condition is false"
fi
