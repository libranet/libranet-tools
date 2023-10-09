#!/bin/bash
# Execute this script
#  > create-env-pgadmin4.sh pgadmin4 4.18
# set -x
set -e

PYTHON="3.7"   # set default python-version to 3.7
ENV_NAME=${1:-"pgadmin4"}
ENV_DIR="$MINICONDA_PREFIX/envs/$ENV_NAME"

VERSION_PGADMIN4=${2:-"4.18"}
WHEEL_URL="https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v$VERSION_PGADMIN4/pip/pgadmin4-$VERSION_PGADMIN4-py2.py3-none-any.whl"

A=1   # current step-number
B=6   # total number of steps

check_args() {
    if [[ -z "$MINICONDA_PREFIX" ]]; then
        echo -e "The env-variable MINICONDA_PREFIX is not set."
        echo -e "Please set this env-variable to the location of the miniconda-directory (e.g. $HOME/miniconda or /opt/miniconda):"
        echo -e "    >>> export MINICONDA_PREFIX=$HOME/miniconda"
        exit
    fi
}


create_conda_env() {
    echo -e "\nStep $A/$B: Creating conda-env in $ENV_DIR"
    ((A=A+1))
    "$MINICONDA_PREFIX/bin/conda" create --yes -n "$ENV_NAME" python="$PYTHON"
}


install_wheel_from_url() {
    echo -e "\nStep $A/$B: installing pgadmin4 from url $WHEEL_URL"
    echo -e "          executing: pip install $WHEEL_URL"
    "$ENV_DIR/bin/python" -m pip install "$WHEEL_URL"
}


install_python_packages() {
    echo -e "\nStep $A/$B: installing python-packages: "
    ((A=A+1))
    PACKAGES=(
      supervisor
        )
    for P in "${PACKAGES[@]}"; do
        echo -e "          executing: pip install $P"
        "$ENV_DIR/bin/python" -m pip install "$P"
    done
}


create_directories() {
    echo -e "\nStep $A/$B: Creating directory-structure in $ENV_DIR/"
    ((A=A+1))
    directories=(
    "bin"
    "etc"
    "src"
    "var/log"
    "var/run"
    "var/tmp"
    )
    for d in "${directories[@]}"; do
        mkdir -p "$ENV_DIR/$d"
    done
}


create_symlinks() {
    echo -e "\nStep $A/$B: Creating symlinks in $HOME/bin/"
    ((A=A+1))
    FILES=(
        pgadmin4
        )
    for F in "${FILES[@]}"; do
        echo -e "          Creating symlink to $ENV_DIR/bin/$F in $HOME/bin/$F"
        ln -sf "$ENV_DIR/bin/$F" "$HOME/bin"
    done
}


print_message() {
    echo -e ""
    echo -e ""
    echo -e "You have succesfully installed the pgadmin4 in $ENV_DIR"
    echo -e "\n\n"
    echo -e "Entering your newly created environment $ENV_DIR"
    # echo -e "Now you can point your browser to http://<ipaddress>:8888"
    cd "$ENV_DIR"
}


# start main-script
check_args
create_conda_env
install_wheel_from_url
install_python_packages
create_directories
create_symlinks
print_message
