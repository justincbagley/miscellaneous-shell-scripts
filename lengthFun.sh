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


## Input file is "$1" and must be FASTA format, either sequential or interleaved with a 
## hard wrap of some length on each line of each sequence.

file="$1"

sed -i '' 's/^/\>/g' "$file";
sed -i '' 's/\n\>/\>/g' "$file";

lengthFun () {
  for line in $(cat "$1"); do 
    printf $line | wc -c >> lengths_out.txt; 
  done
}

lengthFun

exit 0
