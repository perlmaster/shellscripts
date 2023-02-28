#!/usr/bin/ksh

######################################################################
#
# File      : curses.sh
#
# Author    : Barry Kimelman
#
# Created   : February 7, 2005
#
# Purpose   : Module containing functions and data to implement screen
#             manipulation functionality in a manner similar to the way the
#             curses library does for C programs.
#
#             It contains several functions :
#                 (1) init_screen
#                 (2) move_cursor
#                 (3) clear_screen
#                 (4) clear_eol
#                 (5) clear_bol
#                 (6) clear_eos
#                 (7) cursor_bottom
#                 (8) cursor_up_1
#                 (9) cursor_down_1
#                 (10) cursor_back_1
#                 (11) cursor_forward_1
#                 (12) cursor_home
#                 (13) cursor_save
#                 (14) cursor_restore
#                 (15) reset_attr
#                 (16) set_fg_color
#                 (17) set_bg_color
#                 (18) set_reverse_video
#                 (19) set_bold_mode
#                 (20) read_character_no_echo
#
#             See function header comments for further details.
#
######################################################################

######################################################################
#
# Function  : init_screen
#
# Purpose   : Do initialization for screen manipulation functions.
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : init_screen
#
# Notes     : (none)
#
######################################################################

function init_screen
{
	CUP1=`tput cuu1`
	CDOWN1=`tput cud1`
	CBACK1=`tput cub1`
	CFORWARD1=`tput cuf1`
	CHOME=`tput home`
	CSAVE=`tput sc`
	CRESTORE=`tput rc`

	NUM_SCREEN_LINES=`tput lines`
	let "NUM_SCREEN_LINES2 = NUM_SCREEN_LINES - 1"

	NUM_SCREEN_COLS=`tput cols`
	let "NUM_SCREEN_COLS2 = NUM_SCREEN_COLS - 1"
	LLC=`tput cup $NUM_SCREEN_LINES2 0`

	BOLD=$(tput smso)
	NOBOLD=$(tput rmso)
	UL=$(tput smul)
	NOUL=$(tput rmul)

	CLEAR=`tput clear`  # clear screen and home cursor
	CLB=`tput el1`  # clear to beginning of line
	CLE=`tput el`  # clear to end of line
	CLD=`tput el`  # clear to end of display

	return
} # end of init_screen

######################################################################
#
# Function  : move_cursor
#
# Purpose   : Move the cursor to the specified position.
#
# Inputs    : $1 - row number
#             $2 - column number
#             $3 - flag indicating if arguments are zero-origin or one-origin
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : move_cursor $row $col 1
#
# Notes     : If the coordinates are one-origin then they must be
#             converted to zero-origin.
#
######################################################################

function move_cursor
{
	typeset -i row
	typeset -i col
	typeset -i origin
	typeset move

	row=$1
	col=$2
	if [[ $origin != 0 ]]
	then
		let "row -= 1"
		let "col -= 1"
	fi
	move=`tput cup $row $col`
	echo -n "${move}"

	return
} # end of move_cursor

######################################################################
#
# Function  : clear_screen
#
# Purpose   : Clear the screen and "home" the cursor.
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : clear_screen
#
# Notes     : (none)
#
######################################################################

function clear_screen
{
	echo -n "${CLEAR}"

	return
} # end of clear_screen

######################################################################
#
# Function  : clear_eol
#
# Purpose   : Clear to the end of the line.
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : clear_eol
#
# Notes     : (none)
#
######################################################################

function clear_eol
{
	echo -n "${CLE}"

	return
} # end of clear_eol

######################################################################
#
# Function  : clear_bol
#
# Purpose   : Clear to the beginning of the line.
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : clear_bol
#
# Notes     : (none)
#
######################################################################

function clear_bol
{
	echo -n "${CLB}"

	return
} # end of clear_bol

######################################################################
#
# Function  : clear_eos
#
# Purpose   : Clear to the end of the display.
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : clear_eos
#
# Notes     : (none)
#
######################################################################

function clear_eos
{
	echo -n "${CLD}"

	return
} # end of clear_eos

######################################################################
#
# Function  : cursor_bottom
#
# Purpose   : Move the cursor to the lower-left-corner of the display.
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : cursor_bottom
#
# Notes     : (none)
#
######################################################################

function cursor_bottom
{
	echo -n "${LLC}"

	return
} # end of cursor_bottom

######################################################################
#
# Function  : cursor_up_1
#
# Purpose   : Move the cursor up one line.
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : cursor_up_1
#
# Notes     : (none)
#
######################################################################

function cursor_up_1
{
	echo -n "${CUP1}"

	return
} # end of cursor_up_1

######################################################################
#
# Function  : cursor_down_1
#
# Purpose   : Move the cursor down one line.
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : cursor_down_1
#
# Notes     : (none)
#
######################################################################

function cursor_down_1
{
	echo -n "${CDOWN1}"

	return
} # end of cursor_down_1

######################################################################
#
# Function  : cursor_back_1
#
# Purpose   : Move the cursor backward 1 column.
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : cursor_back_1
#
# Notes     : (none)
#
######################################################################

function cursor_back_1
{
	echo -n "${CBACK1}"

	return
} # end of cursor_back_1

######################################################################
#
# Function  : cursor_forward_1
#
# Purpose   : Move the cursor forward 1 column.
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : cursor_forward_1
#
# Notes     : (none)
#
######################################################################

function cursor_forward_1
{
	echo -n "${CFORWARD1}"

	return
} # end of cursor_forward_1

######################################################################
#
# Function  : cursor_home
#
# Purpose   : Move the cursor forward 1 column.
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : cursor_home
#
# Notes     : (none)
#
######################################################################

function cursor_home
{
	echo -n "${CHOME}"

	return
} # end of cursor_home

######################################################################
#
# Function  : center_message
#
# Purpose   : Write a message centered on the specified row.
#
# Inputs    : $1 - row number
#             $2 - message string
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : center_message 3 "hello world"
#
# Notes     : (none)
#
######################################################################

function center_message
{
	typeset -i row
	typeset -i col
	typeset message
	typeset -i length

	row=$1
	message=$2

	length=${#message}
	let "col = NUM_SCREEN_COLS - length"
	let "col = col / 2"
	move_cursor $row $col 1
	echo -n "$message"

	return
} # end of center_message

######################################################################
#
# Function  : center_message_bold
#
# Purpose   : Write a BOLD message centered on the specified row.
#
# Inputs    : $1 - row number
#             $2 - message string
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : center_message_bold 3 "hello world"
#
# Notes     : (none)
#
######################################################################

function center_message_bold
{
	typeset -i row
	typeset -i col
	typeset message
	typeset -i length

	row=$1
	message=$2

	length=${#message}
	let "col = NUM_SCREEN_COLS - length"
	let "col = col / 2"
	move_cursor $row $col 1
	echo -n "${BOLD}$message${NOBOLD}"

	return
} # end of center_message_bold

######################################################################
#
# Function  : center_message_underline
#
# Purpose   : Write an UNDERLINED message centered on the specified row.
#
# Inputs    : $1 - row number
#             $2 - message string
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : center_message_underline 3 "hello world"
#
# Notes     : (none)
#
######################################################################

function center_message_underline
{
	typeset -i row
	typeset -i col
	typeset message
	typeset -i length

	row=$1
	message=$2

	length=${#message}
	let "col = NUM_SCREEN_COLS - length"
	let "col = col / 2"
	move_cursor $row $col 1
	echo -n "${UL}$message${NOUL}"

	return
} # end of center_message_underline

######################################################################
#
# Function  : cursor_save
#
# Purpose   : Save the current cursor position
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : cursor_save
#
# Notes     : (none)
#
######################################################################

function cursor_save
{
	echo -n "${CSAVE}"

	return
} # end of cursor_save

######################################################################
#
# Function  : cursor_restore
#
# Purpose   : Restore the current cursor position
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : cursor_restore
#
# Notes     : (none)
#
######################################################################

function cursor_restore
{
	echo -n "${CRESTORE}"

	return
} # end of cursor_restore

######################################################################
#
# Function  : reset_attr
#
# Purpose   : Reset attributes to normal
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : reset_attr
#
# Notes     : (none)
#
######################################################################

function reset_attr
{
	tput sgr0

	return
} # end of reset_attr

######################################################################
#
# Function  : get_color_code_from_name
#
# Purpose   : Get the color code corresponding to the specified color name
#
# Inputs    : $1 - color name
#
# Output    : (none)
#
# Returns   : IF valid THEN color code ELSE "?"
#
# Example   : code = get_color_code_from_name red
#
# Notes     : (none)
#
######################################################################

function get_color_code_from_name
{

	declare -a color_names # -a => array
	declare -A color_codes # -A => hash

	color_names=('black' 'red' 'green' 'yellow' 'blue' 'magenta' 'cyan' 'white')
	color_codes=( [black]=0 [red]=1 [green]=2 [yellow]=3 [blue]=4 [magenta]=5 [cyan]=6 [white]=7)

	if [ ${color_codes[$1]+_} ]
	then
		color_code_value=${color_codes[$1]}
	else
		color_code_value=?
	fi

	return $code_value
} # end of get_color_code_from_name

######################################################################
#
# Function  : set_fg_color
#
# Purpose   : Set the forground color
#
# Inputs    : $1 - color name
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : set_fg_color red
#
# Notes     : (none)
#
######################################################################

function set_fg_color
{
	get_color_code_from_name $1
	tput setaf $color_code_value

	return
} # end of set_fg_color

######################################################################
#
# Function  : set_bg_color
#
# Purpose   : Set the background color
#
# Inputs    : $1 - color name
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : set_bg_color red
#
# Notes     : (none)
#
######################################################################

function set_bg_color
{
	get_color_code_from_name $1
	tput setab $color_code_value

	return
} # end of set_bg_color

######################################################################
#
# Function  : set_reverse_video
#
# Purpose   : Activate reverse video
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : set_reverse_video
#
# Notes     : (none)
#
######################################################################

function set_reverse_video
{
	tput rev

	return
} # end of set_reverse_video

######################################################################
#
# Function  : set_bold_mode
#
# Purpose   : Activate bold mode
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : set_bold_mode
#
# Notes     : (none)
#
######################################################################

function set_bold_mode
{
	tput bold

	return
} # end of set_bold_mode

######################################################################
#
# Function  : read_character_no_echo
#
# Purpose   : Read a single character without echoing it
#
# Inputs    : (none)
#
# Output    : (none)
#
# Returns   : (nothing)
#
# Example   : ch=`read_character_no_echo`
#
# Notes     : (none)
#
######################################################################

function read_character_no_echo
{
	typeset ch

	stty -echo
	read -n1 ch
	stty echo
	echo -n "$ch"

	return
} # end of read_character_no_echo
