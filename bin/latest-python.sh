#!/bin/bash
# set -x  # enable for verbose output
set -e  # failing commands cause the shell script to exit immediately


PYTHON=${1:-3.11}   # set default major python version to 3.11
pyenv versions --bare |grep "${PYTHON}"| tail -n 1
