#!/bin/sh

## Inspired by code at URL: https://stackoverflow.com/questions/16750911/count-line-lengths-in-file-using-command-line-tools
## USAGE: lengthHistFun <inputFile>
## 
## Outputs single file named 'output.txt' containing histogram values for file line lengths.

lengthHistFun () {
printf "%s %s\n" $(for line in $(cat "$1"); do printf $line | wc -c; done | sort -n | uniq -c | sed -E "s/([0-9]+)[^0-9]+([0-9]+)/\2 \1/") > lengths_out.txt
}

lengthHistFun

exit 0
