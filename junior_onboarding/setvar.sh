#!/bin/bash

VAR=${1:?"Error. You didn't set the variable"}

echo "${VAR}"

grep --color "${VAR}" ../new.txt