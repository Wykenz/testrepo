#!/bin/bash

function check_diskspace {
	local percent

	percent=$(list_percent)

	if [ -n "${percent}" ]
	then
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
	local line

	while read -r line
	do
		if [ "${line%'%'}" -lt 20 ]
		then
			echo "${line}"
		fi
	done < <(df -h | awk '{print$5}' | tail -n +2)
}

check_diskspace