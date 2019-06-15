#! /usr/bin/bash
touch file.txt
file=/home/Desktop/file.txt
trap "rm -f $file && echo file deleted; exit" 0 2 15 # catch several signal

trap "echo Exit signal is detected" SIGINT # or value, detect the ctrl+c signal
trap "echo Exit Signal is detected" SIGKILL # will not work
echo "pid is $$"
while (( COUNT < 10 ))
do
	sleep 10
	(( COUNT++ ))
	echo $COUNT
done
exit 0

trap "echo Exit command is detected" 0 # execite the command when receive the signal 0 
echo "Hello World"
exit 0