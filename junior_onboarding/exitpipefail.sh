#!/bin/bash

set -o pipefail

grep ^nonexistant_user /etc/passwd | cut -f 5 -d

echo $?