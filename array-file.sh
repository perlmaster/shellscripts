#!/usr/bin/bash

######################################################################
#
# File      : array-file.sh
#
# Author    : Barry Kimelman
#
# Created   : December 11, 2020
#
# Purpose   : bash array handling with text file
#
# Notes     :
#
######################################################################

if [[ $# < 1 ]]
then
	echo "Usage : $0 filename"
	exit 1
fi

filename=$1
if [[ ! -f "$filename" ]]
then
	echo "'$filename' is not a file"
	exit 1
fi

echo "Load content from the file $filename into an array"
cat -vn $filename
echo

num_lines=`wc -l $filename | awk '{print $1}'`
echo -e "\nActual number of lines in file '$filename' is $num_lines"
let "index = 1"
let "index2 = 0"
while [ $index -le $num_lines ]
do
	buffer=`head -$index $filename | tail -1`
	let "index = index + 1"
	content[$index2]=$buffer
	let "index2 = index2 + 1"
done
count=${#content[@]} # count length of array
echo -e "\ndata in contents array [ $count ] are"
let "index = 0"
while [ $index -lt $num_lines ]
do
	echo ${content[$index]}
	let "index = index + 1"
done


exit 0
