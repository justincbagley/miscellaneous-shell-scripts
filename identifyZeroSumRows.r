#!/usr/bin/env Rscript

## IDENTIFY ZERO SUM ROWS 
for(i in 1:nrow(input)){
	if (rowSums(input[i,]) == '0') {
		print(i)    ## This prints the line #s
	}
}

