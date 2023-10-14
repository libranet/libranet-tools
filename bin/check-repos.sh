#!/bin/bash
# set -x  # enable for verbose output
set -e  # failing commands cause the shell script to exit immediately

# THIS_DIR=$(readlink -f "$(dirname "$(readlink -f "$0")")")

TOOLS_DIR=$(dirname "$(dirname "$(readlink -f "$0")")")

DOTFILES_DIR="$HOME/.dotfiles"


check_dotfiles () {
    echo -e "\nChecking git-status in ${DOTFILES_DIR}."
    cd "${DOTFILES_DIR}"
    git status
    git pull --quiet
    # git commit -m 'update' .
    git push --quiet
    echo -e "\n\n"
}

check_tools () {
    echo -e "Checking git-status in ${TOOLS_DIR}."
    cd "${TOOLS_DIR}"
    git status
    git pull --quiet
    # git commit -m 'update' .
    git push --quiet
    echo -e "\n"
}

# start main-script
check_dotfiles
check_tools