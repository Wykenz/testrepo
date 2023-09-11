#!/bin/bash

DIR=${1}

function check_if_mounted {
	MOUNTED=$(lsblk -o MOUNTPOINT | grep --color "${DIR}")

	if [ -n  "${MOUNTED}" ]
	then
		lsblk | grep --color "${DIR}"
	else
		echo "This directory is not mounted"
	fi
}

function main {
	check_usage

	check_if_mounted
}

function check_usage {
	if [ -z "${DIR}" ]
	then
		echo "Type the name of a device or directory"
		echo "example: $0 /home"
			
		exit 1
	fi
}

main 