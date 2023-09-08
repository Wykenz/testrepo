#!/bin/bash

LENGHT=$2
QUANTITY=$1

function check_usage {
    if [ -z "${LENGHT}" ]  || [ -z "${QUANTITY}" ]
    then
        echo "Type the number of passwords you want and the lenght of them."
        echo "example: $0 5 10"
        
        exit 1
    fi
}

function main {
    check_usage

    generate_pass
}

function generate_pass {
    if [[ ! "${QUANTITY}" =~ ^[0-9]+$ ]] || [[ ! "${LENGHT}" =~ ^[0-9]+$ ]]
    then
        echo "This input is not a number"

        exit 1
    else
        echo "Here are your passwords, ${USER}"
        echo " "

        for ((n=0;n<"${QUANTITY}";n++))
        do 
            tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c "${LENGHT}"

            echo
        done
    fi
}

main "${@}"