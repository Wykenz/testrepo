#!/bin/bash

NAME=$1

function check_usage {
	if [ -z "${NAME}" ]
	then
		echo "Type the name of the file or directory you want to delete."
		echo "example: $0 filename"

		exit 1
	fi
}

function delete {
	echo "Do you want to delete the files? y/n"

	local choice

	read -r choice

	if [ "${choice}" = "y" ]
	then
		sudo find / -iname "${NAME}" -delete
	fi
}

function main {
	check_usage

	search

	delete
}

function search {
	local search
	
	search=$(sudo find / -iname "${NAME}")

	echo "${search}"

	if [ -z "${search}" ]
	then
		echo "No file with that name"

		exit 1
	fi
}

main