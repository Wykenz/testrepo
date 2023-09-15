#!/bin/bash

for i do
    sum=$( expr ${sum} + ${i} )
done
echo "${sum}"