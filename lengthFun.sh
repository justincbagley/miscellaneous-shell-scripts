#!/bin/sh

## Modified from code at URL: https://stackoverflow.com/questions/16750911/count-line-lengths-in-file-using-command-line-tools
## USAGE: lengthFun.sh <inputFile>
## 
## Outputs single 'lengths_out.txt' file containing lengths of each file line.

lengthFun () {
for line in $(cat "$1"); do 
  printf $line | wc -c >> lengths_out.txt; 
done
}

exit 0
