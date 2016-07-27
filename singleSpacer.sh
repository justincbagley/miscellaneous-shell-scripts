#!/bin/sh

##--------------------------------------------------------------------------------------##
##--SHELL SCRIPT FOR CONVERTING FILES FROM DOUBLE/MULTIPLE SPACED TO SINGLE SPACED -----##
#---This code was written July 8, 2016 by:         -------------------------------------##
#---Justin C. Bagley, Ph.D.                        -------------------------------------##
#---Departamento de Zoologia                       -------------------------------------##
#---Universidade de Brasília, Brasília, DF, Brazil -------------------------------------##
#---For questions, please email jcbagley@unb.br    -------------------------------------##
##--------------------------------------------------------------------------------------##

echo "
##########################################################################################
#                             singleSpacer v1.0, July 2016                               #
##########################################################################################
"
#
#
#
for i in ./*_spaced_toy.txt			## Identify and loop through double-spaced input text (.txt) files in current directory.
	do 
	echo $i
	sed '/^$/d' ${i} > ${i}.tmp			## Use sed to convert files from double to single spaced.
	mv ${i}.tmp ${i}_singleSpaced.txt	## Rename output. 
		for j in *.txt_singleSpaced.txt					## Nested loop to cleanup filenames.
			do
			mv $j ${j/.txt_singleSpaced.txt/.out.txt}	## Rename final output file to be kept in working directory.
		done
done

echo "
Done converting file to single spacing. Bye.
"
#
#
#
##--------------------------------------------------------------------------------------##

exit 0