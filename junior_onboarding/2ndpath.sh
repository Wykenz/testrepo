#!/bin/bash

PATH=${1}

CUT=${PATH#/*/*/}
FIRSTPART=${PATH%"${CUT}"}
SECONDPART="/${FIRSTPART#/*/}"
FULL=${PATH/${SECONDPART}/\/2\/}

echo "${FULL}"