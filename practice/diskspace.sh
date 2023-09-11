#!/bin/bash

PERCENTAGE=$(df -h | awk '{if($5>80)print$5}' | tail -n +2)

if [ -n "${PERCENTAGE}" ]
then
	echo "In these Filesystems more than 80% storage space is full:"
	df -h | grep --color "${PERCENTAGE}"
fi