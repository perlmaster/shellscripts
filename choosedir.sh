function choosedir
{
	typeset dirname

	if [[ $# > 0 ]]
	then
		dirname=`choosedir.pl -r`
	else
		dirname=`choosedir.pl`
	fi
	if [[ $? == 0 ]]
	then
		clear
		/bin/ls -ld $dirname
		cd $dirname
	else
		echo "Operation aborted."
	fi
}
