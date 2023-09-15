#!/bin/bash

PATH=${1}

PATH="${PATH/\/*/2}"
#PATH="${PATH%/*}"

echo "${PATH}"