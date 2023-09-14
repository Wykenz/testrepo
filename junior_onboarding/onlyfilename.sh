#!/bin/bash

PATH=${1}

PATH="${PATH##*/}"
PATH="${PATH%.*}"

echo "${PATH}"