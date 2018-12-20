#!/bin/sh

## random01.sh
echo ""

############ CREATE USAGE TEXT
Usage="Usage: $(basename "$0") nRandomNums outputFile
...where the desired number of random 0s or 1s (<nRandomNums>) is mandatory, <outputFile> 
is optional, and if <outputFile> is not provided then random numbers are output to screen.
"

############ POSITIONAL PARAMETERS INFO
echo "The number of arguments is: $#"


############ GENERATE RANDOM 0s AND 1s CONDITIONAL ON INPUT TO PROGRAM
	if [[ "$#" = "0" ]]; then
		echo "$Usage"
		exit 0
	fi


	if [[ "$#" = "1" ]]; then
		echo "Random 0s and 1s:
"
	(
		for i in $(seq 1 "$1"); do
			echo $(($RANDOM%2))
		done
	)
	fi


	if [[ "$#" = "2" ]]; then
	(
		for i in $(seq 1 "$1"); do
			echo $(($RANDOM%2)) >> "$2"
		done
	)
	echo "Random 0s and 1s have been written to $2."
	fi


	if [[ "$#" -gt "2" ]]; then
		echo "Illegal option. Too many positional parameters. See usage below..."
		echo "$Usage"
	fi

echo ""


exit 0

