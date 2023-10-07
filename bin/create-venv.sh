#!/bin/bash
# set -x

# get parameters from the input
ENV_NAME=${1}
V311=$(~/bin/pyenv versions --bare | grep '3.11')
PYTHON_VERSION=${2:-$V311} # set default python-version to 3.11

function help() {
    echo "Usage:"
    echo "    >>> $0 <env-name> <python-version>"
    echo "Example:"
    echo "    >>> $0 project-foo 3.11"
    echo ""
    echo "You need to provide an env-name for your new pyenv-environment."
    exit
}

function check_pyenv_executable() {
    if [ ! -f "$HOME/bin/pyenv" ]; then
        echo -e ""
        echo -e "No pyenv-executable found in $HOME/bin/pyenv"
        echo -e "Please create a symlink via:"
        echo -e "    >>> ln -s ~/.local/pyenv/libexec/pyenv $HOME/bin/pyenv"
        echo -e ""
        echo -e ""
        exit
    fi
}

function create_pyenv() {
    # "$HOME/bin/pyenv" create --yes python="$PYTHON" -n "$ENV_NAME"
    PYENV_VERSION=${PYTHON_VERSION} python -m venv "$ENV_NAME"

    echo -e "Your new pyenv-environment is ready in $(pwd -P in "$ENV_NAME")"
    echo -e ""
    echo -e "You can activate it by executing:"
    echo -e "    >>> cd $ENV_NAME"
    echo -e "    >>> sa"

}

function on_exit() {
    if [ "$?" != "0" ]; then
        echo "There were some failures, please check the logfile or output above."
    else
        echo "All went fine."
    fi
    echo
    exit $?
}

# start main program
trap on_exit EXIT

if [ $# -eq 0 ]; then
    help
fi

check_pyenv_executable
create_pyenv
