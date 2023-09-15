#!/bin/bash

IFS=' '

file="fruits.txt"

for var in $(cat $file) 
do 
echo "$var"
done 