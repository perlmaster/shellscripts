#!/bin/bash

######################################################################
#
# File      : options.sh
#
# Author    : Barry Kimelman
#
# Created   : September 20, 2006
#
# Purpose   : Test of options processing.
#
# Notes     : (none)
#
######################################################################

######################################################################
#
# Function  : debug_print
#
# Purpose   : Print a debugging message.
#
# Inputs    : strings comprising message
#
# Output    : the message
#
# Returns   : (nothing)
#
# Example   : debug_print "This is a test"
#
# Notes     : (none)
#
######################################################################

function debug_print
{
	if [ $debug_flag -eq 1 ]
	then
		echo $*
	fi
}

######################################################################
#
# Function  : main
#
# Purpose   : program entry point
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : nameofscript arg1
#
# Notes     : (none)
#
######################################################################

debug_flag=0
errors=0
opt_a=0
while getopts ado: opt
do
	case $opt in
	a)
		FLAG=$opt
		;;
	d)
		debug_flag=1
		;;
	o)
		OARG=$OPTARG
		;;
	\?)
		errors=1
	esac
done

shift `expr $OPTIND - 1`

echo "$0 : All args after parameters are : $*"
if [ $errors -eq 1 ]
then
	echo "Aborted due to parameter errors."
	exit 1
fi
debug_print "Debug message 1"

for var in $*
do
	echo "-- $var --"
done

exit 0
