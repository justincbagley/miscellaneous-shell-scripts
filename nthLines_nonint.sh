#!/bin/sh

###### Some code to simply read in file name and nth line info and output the nth lines 
## to a new file named "output.txt" in the working directory. 
##
## USAGE: ./nthLines_nonint.sh <inputFile> <nthLineFreq>
##
## where <inputFile> is a text or other input file, and <nthLineFreq> gives the frequency
## (n) of lines that you would like to keep.

if [[ ! -f ./output.txt ]]; then
  awk 'NR == 1 || NR % '$2' == 0' $1 | sed '1d' > output.txt
elif [[ -f ./output.txt ]]; then
  echo "WARNING!  | $(date) | File named 'output.txt' already exists in current working directory. This file will be overwritten."
  awk 'NR == 1 || NR % '$2' == 0' $1 | sed '1d' > output.txt
fi

exit 0
