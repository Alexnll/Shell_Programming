#! /usr/bin/bash

# n=1

# while [ $n -le 3 ]
# do
#		echo "$n"
#		(( n++ ))
#		gnome-terminal &  # open a new terminal
#		sleep 1
# done

# while read p
# do
#	echo $p
# done < useOr.sh

# cat hello.sh | while read p
# do
#	echo $p
# done

while IFS= read -r line # space is important, assign a space to IFS
do 
	echo $line
done < /etc/hosts