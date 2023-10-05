#!/bin/bash

IFS=$'\n'

file="fruits.txt"

for f in $(cat $file)
do
	echo "${f}"
done 