#!/bin/bash

FULLPATH=${1}

function cut_input {
	CUT=${FULLPATH#/*/}
	PART=${FULLPATH%"${CUT}"}
	FIRSTDIR=${PART%/}

	echo "${FIRSTDIR}"
}

cut_input