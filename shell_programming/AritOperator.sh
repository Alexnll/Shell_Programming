#! /usr/bin/bash


read -p "Print in two words:" num1 num2
read -p "What you want to calculate:" operator

if [ $operator == "+" ]
then
	echo $((num1 + num2))
elif [ $operator == "-" ]
then
	echo $((num1 - mnum2))
else
	echo "error"
fi

