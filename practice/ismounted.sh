#!/bin/bash

DIR=$1d

function check_usage {
    if [ -z "${DIR}" ]
    then
        echo "Type the name of a device or directory"
        echo "example: $0 /home"
        
        exit 1
    fi
}

if [ -n "${DIR}" ]
then
    MOUNTED=$(lsblk -o MOUNTPOINT | grep --color "${DIR}")
fi

if [ -n  "${MOUNTED}" ]
then
    lsblk | grep --color "${DIR}"
else
    echo "This directory is not mounted"
fi
