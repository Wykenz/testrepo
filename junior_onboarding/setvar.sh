#!/bin/bash

set -u

VAR=${1}

echo "${VAR}"

grep --color "${VAR}" ../new.txt