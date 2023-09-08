#!/bin/bash

df -h | awk '{print$5}' | tail -n 9