#! /usr/bin/bash

for command in ls -al pwd date
do
	echo "-------$command---------"
	$command
done

#for item in *
#do
#	if [ -d item ]
#	then
#		echo $item
#	fi
#done