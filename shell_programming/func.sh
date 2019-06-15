#! /usr/bin/bash

function hello(){
	echo "Hello"
}

quit(){
	exit
}

function print(){   #function with argument
	echo $1 $2 $3
}

function local(){
	local name=$1			# local variable
	echo "the name is $name"
}

print Hello high
hello
quit
hello