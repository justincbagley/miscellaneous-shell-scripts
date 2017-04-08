#!/bin/sh

##########################################################################################
#                             singleSpacer v1.0, July 2016                               #
#   SHELL SCRIPT CONVERTING TEXT FILES FROM DOUBLE/MULTIPLE SPACED TO SINGLE SPACED      #
#   Copyright (c)2016 Justin C. Bagley, Universidade de Brasília, Brasília, DF, Brazil.  #
#   See the README and license files on GitHub (http://github.com/justincbagley) for     #
#   further information. Last update: July 8, 2016. For questions, please email          #
#   jcbagley@unb.br.                                                                     #
##########################################################################################

echo "
##########################################################################################
#                             singleSpacer v1.0, July 2016                               #
##########################################################################################
"

(
for i in $(find . -name "*.txt" -type f); do				## Identify and loop through double-spaced input text (.txt) files in current directory.
	echo "$i"
	sed '/^$/d' "${i}" > "${i}".tmp					## Use sed to convert files from double to single spaced.
	mv "${i}".tmp "${i}"_singleSpaced.txt				## Rename output. 
		for j in *.txt_singleSpaced.txt; do			## Nested loop to cleanup filenames.
			mv $j ${j/.txt_singleSpaced.txt/.out.txt}	## Rename final output file to be kept in working directory.
		done
done
)

echo "Done converting text file(s) in current working dir from double to single spacing. Bye.
"
#
#
#
######################################### END ############################################

exit 0
