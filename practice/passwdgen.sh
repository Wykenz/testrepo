#!/bin/bash

LENGHT=$2
QUANTITY=$1

function check_usage {
    if [ ! -n "${LENGHT}" ]  || [ ! -n "${QUANTITY}" ]
    then
        echo "Type the number of passwords you want and the lenght of them."
        echo "example: $0 5 10"
    else
        pass_generate
    fi
}

function main {
    check_usage
}

function pass_generate {
    echo "Here are your passwords, ${USER} :)"
    echo " "

    for ((n=0;n<"${PASS_QUANTITY}";n++))
    do 
        tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c "${PASS_LENGHT}"

        echo
    done
}

main "${@}"