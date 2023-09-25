#!/bin/bash

set -o pipefail

grep ^nonexistant_user /etc/passwd | cut -f 5 -d " "

RETURNVALUE=$?

if [ "${RETURNVALUE}" = 0 ]
then
	echo "Success, return value: ${RETURNVALUE}"
else 
	echo "Fail, return value: ${RETURNVALUE}"
fi