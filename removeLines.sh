#!/bin/sh

## USAGE: removeLines.sh <startLine> <endLine> -i <fileName>

MY_INPUT_FILE=file.txt

while getopts 'i:' opt ; do
  case $opt in
    i) MY_INPUT_FILE=$OPTARG ;;

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

sed -i '' ''"$line1"','"$line2"'d' "$MY_INPUT_FILE"

fi


if [[ "${machine}" = "Linux" ]]; then

####### CASE B: LINUX AND/OR LINUX-BASED SUPERCOMPUTER ENVIRONMENT (RUN ON LINUX)

sed -i ''"$line1"','"$line2"'d' "$MY_INPUT_FILE"

fi

exit 0

