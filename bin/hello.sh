#!/usr/bin/env bash
#
# see https://explainshell.com/
#
# -e: When this option is on, if a simple command fails for any of the reasons listed in Consequences of
#     Shell  Errors or returns an exit status value >0, and is not part of the compound list following a
#     while, until, or if keyword, and is not a part of an AND  or  OR  list,  and  is  not  a  pipeline
#     preceded by the ! reserved word, then the shell shall immediately exit.
#
# -u: The shell shall write a message to standard error when it tries to expand a variable that is not
#     set and immediately exit. An interactive shell shall not exit.
#
# -x: The  shell shall write to standard error a trace for each command after it expands the command and
#     before it executes it. It is unspecified whether the command that turns tracing off is traced.

#  https://raw.githubusercontent.com/libranet/installers/main/scripts/hello.sh
set -e # exit on error
set -u # exit on unset variable
# set -x  # verbose debugging output

# on macOS, the readlink command does not support the -m option.
# use greadlink from the coreutils-brew-package
# brew install coreutils
READLINK=$(command -v greadlink || command -v readlink)

# This script could be symlinked from another location.
CANONICAL_SCRIPT_DIR=$(readlink -f $(dirname $(readlink -f $0)))
# PARENT_DIR=$(readlink -m ${CANONICAL_SCRIPT_DIR}/..)
# PARENT_DIR=$(realpath -m "${CANONICAL_SCRIPT_DIR}/..")

PARENT_DIR=$(${READLINK} -f $(dirname $(readlink -f $0)))

echo -e "Running script located in ${CANONICAL_SCRIPT_DIR}"
echo -e "Parent-dir is ${PARENT_DIR}"

function1() {
    echo -e "Running function1() from ${CANONICAL_SCRIPT_DIR}"
    # bash2
}

function2() {
    echo -e "Running function2()"
}

## main program
function1
function2
