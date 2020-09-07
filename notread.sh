#!/usr/bin/bash

######################################################################
#
# File      : notread.sh
#
# Author    : Barry Kimelman
#
# Created   : September 6662020
#
# Purpose   : Descend down a directory tree and find unreadable files
#
# Notes     : (none)
#
######################################################################

if [[ $# < 1 ]]
then
	dirname="."
else
	dirname="$1"
fi

tempfile=`mktemp`
find "$dirname" -type f -print | while read filename
do
	if [[ ! -r "$filename" ]]
	then
		/bin/ls -ld "$filename"
		echo "$filename" >> $tempfile
	fi
done
count=`wc -l $tempfile | awk '{print $1}'`
echo -e "\n$count non readable files were found under $dirname"

/bin/rm -f $tempfile
