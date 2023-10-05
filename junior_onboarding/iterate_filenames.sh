#!/bin/bash

FILENAMES=$(ls -1d *\.*)

function iterate_filenames {
	local line

	for line in ${FILENAMES}
	do 
		echo "Processing ${line} file"
	done 
}

iterate_filenames