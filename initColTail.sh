#!/bin/sh


initCol () {
Usage="initColTail [Help: -h help] <inputFile> 

Prints last ten columns and rows of tab-separated file. "

if [[ "$1" == "-h" ]] || [[ "$1" == "-help" ]]; then
	echo "$Usage"
	exit
fi

cat $1 | awk '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10}' | tail

}

exit 0
