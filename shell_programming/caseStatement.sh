#! /usr/bin/bash

echo -e "Enter some character: \c"
read value

# read -p "Print in a word: "  num

# case $num in
case $value in
	[a-z] )
		echo "a-z" ;;
	[A-Z] )
		echo "A-Z" ;;
	[1-9] )
		echo "1-9" ;;
	? ) # other one character
		echo "special character" ;;
	* ) # more than one other character
		echo "Unknow input" ;;
esac
