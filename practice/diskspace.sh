#!/bin/bash

function check_diskspace {
	local percent

	percent=$(list_numbers)

	if [ -n "${percent}" ]
	then
		percent=$(list_percent)

		echo "In these Filesystems more than 80% storage space is full:"
		
		df -h | grep --color "${percent}"
	else
		echo "No Filesystem has less than 20% disk space"
	fi
}

function list_percent {
	local number

	number=$(list_numbers)

	while read -r number
	do
		echo "${number}%"
	done < <(echo "${number}")
}

function list_numbers {
	local line

	while read -r line
	do
		if [ "${line}" -gt 80 ]
		then
			echo "${line}"
		fi
	done < <(df -h | awk '{print$5}' | tail -n +2 | sed 's/%//')
}

check_diskspace