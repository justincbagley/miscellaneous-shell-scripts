#!/bin/sh

###### Some code to simply read in file name and nth line info and output the nth lines 
## to a new file named "output.txt" in the working directory:

## MY_INPUT_FILE=./*.txt
read -p "Please enter the name of your input file : " MY_INPUT_FILE
read -p "Please enter the frequency (n) of nth lines that you would like to keep : " NTH_LINES

awk 'NR == 1 || NR % '$NTH_LINES' == 0' $MY_INPUT_FILE | sed '1d' > output.txt


exit 0
