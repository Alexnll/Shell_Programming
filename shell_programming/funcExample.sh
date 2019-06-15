#! /usr/bin/bash

function usage(){
	echo "You need to provide an argument: "
	echo "usage: $)file_name"
}


function is_file_exist(){
	local file="$1"   #$1 means the first argument provided for the function
	[[ -f "$file" ]] && return 0 || return 1  # ternary operation
}

[[ $# -eq 0 ]] && usage

if(is_file_exist "$1") # here $1 means the first argument provided for the scrpit
then
	echo "file found"
else
	echo "not found"
fi