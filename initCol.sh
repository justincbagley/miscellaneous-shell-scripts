#!/bin/sh


initCol () {
Usage="initCol [Help: -h help] <inputFile> 

Prints first ten columns and rows of tab-separated file. "

if [[ "$1" == "-h" ]] || [[ "$1" == "-help" ]]; then
	echo "$Usage"
	exit
fi

cat $1 | awk '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10}' | head

}

initCol

exit 0
