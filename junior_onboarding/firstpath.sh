#!/bin/bash

PATH=${1}

CUT=${PATH#/*/}
PART=${PATH%"${CUT}"}
FIRSTDIR=${PART%/}

echo "${FIRSTDIR}"