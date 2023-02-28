#!/usr/bin/ksh

######################################################################
#
# File      : test1.sh
#
# Author    : Barry Kimelman
#
# Created   : February 11, 2023
#
# Purpose   : Run some tests for the curses.sh module
#
# Notes     : (none)
#
######################################################################

######################################################################
#
# Function  : MAIN
#
# Purpose   :
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : 0 --> success , non-zero --> failure
#
# Example   : test1.sh
#
# Notes     : (none)
#
######################################################################

basename=`basename $0`

dirpath=`dirname $0`
. $dirpath/curses.sh
init_screen
reset_attr
clear_screen

row=3
col=15

move_cursor $row $col
# set_fg_color yellow
tput setaf 3 # set foreground color to yellow

echo "XXX Corp Ltd."
reset_attr

let "row = row + 2"
move_cursor $row $col
set_reverse_video
echo "M A I N - M E N U"
reset_attr

cursor_bottom
cursor_up_1
echo "Goodbye ..."

exit 0
