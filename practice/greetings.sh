#!/bin/bash

TIME=$(date +%H:%M)

function greetings {
    echo "The time is: ${TIME}"

    if [[ ${TIME} < "10:00" ]] && [[ ${TIME} > "04:59" ]]
    then
        echo "Good morning, ${USER}"

    elif [[ ${TIME} < "12:00" ]] && [[ ${TIME} > "09:59" ]]
    then
        echo "Good day, ${USER}"

    elif [[ ${TIME} < "18:00" ]] && [[ ${TIME} > "11:59" ]]
    then
        echo "Good afternoon, ${USER}"

    elif [[ ${TIME} < "20:00" ]] && [[ ${TIME} > "17:59" ]]
    then
        echo "Good evening, ${USER}"

    elif [[ ${TIME} < "24:00" ]] || [[ ${TIME} < "05:00" ]]
    then
        echo "Good night, ${USER}"
        
    fi
}

function main {
    greetings
}

main