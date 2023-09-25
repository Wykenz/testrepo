#!/bin/bash

FULLPATH=${1}

function cut_input {
	WITHEXTENSION="${FULLPATH##*/}"
	FILENAME="${WITHEXTENSION%.*}"
	
	echo "${FILENAME}"
}

cut_input