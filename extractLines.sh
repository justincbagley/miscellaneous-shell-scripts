#!/bin/sh

## USAGE: extractLines.sh <startLine> <endLine> -i <inputFile> -o <outputFile>

MY_INPUT_FILE=file.txt
MY_OUTPUT_FILE=output.txt

Usage="Usage: $(basename "$0") [Help: -h help] <startLine> <endLine> [Options: -i o]
 ## Help:
  -h   help text (also: -help)

 ## Mandatory parameters:
 <startLine>   starting line of range of lines to be extracted from <inputFile>
 <endLine>     final line in range of lines to be extracted
 
 ## Options:
  -i   inputFile (def: file.txt) input file
  -o   outputFile (def: output.txt) name of output file to which extracted lines will be
       written

 ## EXAMPLES: 
 ## Practical usage example (with description below):

 ./extractLines.sh 1 106 -i ./matrix.txt -o ./matrix_firsts106.txt
 
 The above reads input file named 'matrix.txt' and directs the program to extract the first
 106 lines of the file and save them in a new file named 'matrix_first106.txt'. Notice
 that -i and -o flags must be followed by name of <inputFile> and <outputFile>, respectively.
 Though not mandatory positional parameters, these flags will usually need to be passed, as
 <inputFile> and <outputFile> defaults for the script are unlikely to be appropriate.

Copyright ©2018 Justinc C. Bagley
May 31, 2018, Richmond, VA
"

if [[ "$1" == "-h" ]] || [[ "$1" == "-help" ]]; then
	echo "$Usage"
	exit
fi

while getopts 'i:o:' opt ; do
  case $opt in
    i) MY_INPUT_FILE=$OPTARG ;;
    o) MY_INPUT_FILE=$OPTARG ;;

## Missing and illegal options:
    :) printf "Missing argument for -%s\n" "$OPTARG" >&2
       echo "$Usage" >&2
       exit 1 ;;
   \?) printf "Illegal option: -%s\n" "$OPTARG" >&2
       echo "$Usage" >&2
       exit 1 ;;
  esac
done

shift $((OPTIND-1)) 
### Check for mandatory positional parameters:
if [ $# -lt 1 ]; then
echo "$Usage"
  exit 1
fi


###### Read mandatory pos params:
"$1"=line1
"$2"=line2

###### Check machine type:
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
echo "INFO      | $(date) |          System: ${machine} "
echo "INFO      | $(date) |          ... "



if [[ "${machine}" = "Mac" ]]; then

####### CASE A: LOCAL MAC MACHINE (RUN LOCALLY)

sed -n ''"$line1"','"$line2"'p' "$MY_INPUT_FILE" > "$MY_OUTPUT_FILE"

fi


if [[ "${machine}" = "Linux" ]]; then

####### CASE B: LINUX AND/OR LINUX-BASED SUPERCOMPUTER ENVIRONMENT (RUN ON LINUX)

sed -i ''"$line1"','"$line2"'d' "$MY_INPUT_FILE" > "$MY_OUTPUT_FILE"

fi

exit 0

