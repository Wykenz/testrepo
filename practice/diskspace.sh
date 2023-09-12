#!/bin/bash

function check_diskspace {
	local percent

	percent=$(list_numbers)

	if [ -n "${percent}" ]
	then
		percent=$(list_percent)

		if [ -n "${percent}" ]
		then
			local line

			while read -r line
			do
				echo "The mountpoint ${line} , uses less data than 20%"	
			done < <(df -h | tail -n +2 | grep "${percent}")
		fi
	else 
		echo "No mountpoint uses less data than 20%"
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
		if [ "${line}" -lt 20 ]
		then
			echo "${line}"
		fi
	done < <(df -h | awk '{print$5}' | tail -n +2 | sed 's/%//')
}

check_diskspace