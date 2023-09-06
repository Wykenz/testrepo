#!/bin/bash

NAME=$1

function delete {
    echo "Do you want to delete the files? y/n"

    read -r choice

    if [ "${choice}" = "y" ]
    then
        sudo find ~ -iname "${NAME}" -delete
    else
        return
    fi
}

function main {
    search

    delete
}

function search {
    sudo find ~ -iname "${NAME}" | grep --color "${NAME}"
}

main "$@"