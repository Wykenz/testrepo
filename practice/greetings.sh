#!/bin/bash

HOUR=$(date +%H)
TIME=$(date +%H:%M)

echo "The time is: ${TIME}"

function greetings {
    if [[ ${HOUR} -lt 9 ]]
    then
        echo "Good morning, ${USER}"
    elif [[ ${HOUR} -lt 12 ]]
    then
        echo "Good day, ${USER}"
    elif [[ ${HOUR} -lt 18 ]]
    then
        echo "Good afternoon, ${USER}"
    elif [[ ${HOUR} -lt 20 ]]
    then
        echo "Good evening, ${USER}"
    elif [[ ${HOUR} -lt 24 ]]
    then
        echo "Good night, ${USER}"
    fi
}
 greetings