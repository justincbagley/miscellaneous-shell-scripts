#!/bin/sh

## Modified from code at URL: https://stackoverflow.com/questions/16750911/count-line-lengths-in-file-using-command-line-tools
## USAGE: lengthFun.sh <inputFile>
## 
## Outputs single 'lengths_out.txt' file containing lengths of each file line.

######################################## START ###########################################
echo "INFO      | $(date) | STEP #1: SETUP. "
##--Make other important functions/variables:
	CR=$(printf '\r'); 
	calc () { 
		bc -l <<< "$@" 
}


## Input sequence file is "$1" and must be FASTA format, (sequential or interleaved with a 
## hard wrap of some length on each line of each sequence. Fourth sed should account for 
## newlines/blank lines without spaces if present between sequences. NOTE that this script
## modifies the original file and outputs sequence lengths into a file with the default
## filename 'lengths_out.txt'. I hope to add options to customize it soon.

file="$1"

	sed -i '' 's/^/\>/g' "$file";
	perl -p -i -e $'s/\n//g' "$file";	
	perl -p -i -e $'s/\>\>[A-Za-z0-9\-\_\ \.]*\>/\n/g; s/\>\>[A-Za-z\.0-9\-\_]*\>/\n/g' "$file";
	perl -p -i -e $'s/^$\n//g' "$file";

	
## Remove runs of Ns indicating missing data at the start or end of each sequence:

	perl -p -i -e 's/^[Nn\>]{2,}//g; s/[Nn\>]{2,}$//g' "$file";


## Remove ">" markers:

	sed -i '' 's/\>//g' "$file";

## Generate and run length function on edited sequence file:

lengthFun () {
  for line in $(cat "$1"); do 
    printf $line | wc -c >> lengths_out.txt; 
  done
}

lengthFun

exit 0
