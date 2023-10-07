#!/bin/bash
# set -x  # enable for verbose output
set -e  # failing commands cause the shell script to exit immediately

# get parameters from the input
ENV_NAME=${1}
PYTHON=${2:-3.11}   # set default python-version to 3.11


function help_() {  # don't shadow help-builtin
    echo "Usage:"
    echo "    >>> $0 <env-name> <python-version>"
    echo "Example:"
    echo "    >>> $0 project-foo 3.11"
    echo ""
    echo "You need to provide an env-name for your new conda-environment."
    exit
}


function check_conda_executable() {
    if [[ -z "$MINICONDA_PREFIX" ]]; then
        echo "\$MINICONDA_PREFIX is not set"
        echo "\export MINICONDA_PREFIX=<path-to-miniconda-root-dir>"
        exit
    fi

    if [[ ! -f "$MINICONDA_PREFIX/bin/conda" ]]; then
        echo -e ""
        echo -e "No conda-executable found in $MINICONDA_PREFIX/bin/conda"
        echo -e ""
        exit
    fi
}


function create_conda_env() {
    "$MINICONDA_PREFIX/bin/conda" create --yes python="$PYTHON" -n "$ENV_NAME"
    # echo -e "Your new conda-environment is ready in $(pwd -P "$MINICONDA_PREFIX/envs/$ENV_NAME")"
    echo -e "Your new conda-environment is ready in $MINICONDA_PREFIX/envs/$ENV_NAME"
    echo -e ""
    echo -e "You can activate it by executing:"
    echo -e "    >>> source activate $ENV_NAME"
    echo -e "Or via the shorter alias:"
    echo -e "    >>> sa $ENV_NAME"
    ENV_DIR="$MINICONDA_PREFIX/envs/$ENV_NAME"
}


function create_dir_structure() {
    echo -e "Creating basic directory-structure.\n"
    mkdir -p $ENV_DIR/etc
    mkdir -p $ENV_DIR/src
    mkdir -p $ENV_DIR/var/cache
    mkdir -p $ENV_DIR/var/log
    mkdir -p $ENV_DIR/var/run
    mkdir -p $ENV_DIR/var/tmp
}


function set_pip_conf() {
    echo -e "Creating a symlink from ${MINICONDA_PREFIX}/envs/$ENV_NAME/pip.conf to ${MINICONDA_PREFIX}/pip.conf\n"
    cd ${MINICONDA_PREFIX}/envs/${ENV_NAME}
    ln -s ../../pip.conf pip.conf
}


function set_condarc() {
    echo -e "Creating a symlink from ${MINICONDA_PREFIX}/envs/$ENV_NAME/.condarc to ${MINICONDA_PREFIX}/condarc\n"
    cd ${MINICONDA_PREFIX}/envs/${ENV_NAME}
    ln -s ../../condarc .condarc
}


function on_exit () {
    if [[ "$?" != "0" ]] ; then
        echo "There were some failures, please check the logfile or output above."
    else
        echo "All went fine."
    fi
    echo
    exit $?
}


# start main program
trap on_exit EXIT

if [[ $# -eq 0 ]]; then
    help_
fi

check_conda_executable
create_conda_env
create_dir_structure
set_pip_conf
set_condarc
