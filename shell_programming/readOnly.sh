#! /usr/bin/bash

readonly var=31
# or: readonly var
var=50
echo "var => $var"

function hello(){
	echo "Hello world"
} 
hello
readonly -f hello # -f for function

function hello(){
	echo "Hello world again"
} 

readonly