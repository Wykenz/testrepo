#!/bin/bash

FULLPATH=${1}

function cut_input {
	CUT=${FULLPATH#/*/*/}
	FIRSTPART=${FULLPATH%"${CUT}"}
	SECONDPART="/${FIRSTPART#/*/}"
	FULL=${FULLPATH/${SECONDPART}/\/2\/}

	echo "${FULL}"
}

cut_input