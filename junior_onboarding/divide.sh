#!/bin/bash

NUMBER_1=${1}
NUMBER_2=${2}

RESULT=$(echo "scale=4; ${NUMBER_1} / ${NUMBER_2}" | bc)

if [[ "${RESULT}" == *".0000" ]]
then
	echo "${RESULT%.*}"
else
	echo "${RESULT}"
fi