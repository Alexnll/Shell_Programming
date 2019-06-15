#! /usr/bin/bash

echo -e "Enter the name of the file:  \c"
read file_name

if [ -e $file_name ]
then 
	if [ -w $file_name ]  # check write permission
	then
		echo "Type some text data. Press ctrl+d to to quit."
		cat >> $file_name
	else
		echo "The file do not have write permissions."
	fi
else
	echo "$file_name not exists"
fi
