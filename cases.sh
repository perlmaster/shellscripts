#!/bin/bash

######################################################################
#
# File      : cases.sh
#
# Author    : Barry Kimelman
#
# Created   : April 21, 2009
#
# Purpose   : Test the case statement.
#
# Notes     : (none)
#
######################################################################

base=`basename $0`
usage="usage: $base {string}"
 
if [[ $# -lt 1 ]]
then
	echo -e "$usage\n"
	exit 1
fi

string="$1"
case $string in
nub?????.oui)
	echo "A nub file"
	;;
nu2?????.oui)
	echo "A nu2 file"
	;;
nub?????.oui.z)
	echo "A compressed nub file"
	;;
nu2?????.oui.z)
	echo "A compressed nu2 file"
	;;
*)
	echo "Unknown type of file"
esac

exit 0
