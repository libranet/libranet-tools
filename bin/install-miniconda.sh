#!/bin/bash
#
# This bash-script installs miniconda in the directory you provide.
#
# Usage:
#     > ./install-miniconda.sh <path-miniconda-root-directory>
#
# Resulting directory-structure:
#
#   $PREFIX/
#     bin/
#       conda
#       conda-env
#       activate
#       deactivate
#     condarc
#     envs/
#        <your-conda-envs-here>
#          pip.conf -> ../../pip.conf
#     etc/
#     pip.conf
#     var/
#       cache/       # cached conda-packages
#       cache-pip/   # cached pip-packages

# set -x  # enable for verbose output
set -e  # failing commands cause the shell script to exit immediately

CANONICAL_SCRIPT_DIR=$(readlink -f "$(dirname "$(readlink -f "$0")")")
MINICONDA_INSTALLER=$(mktemp -t miniconda3-latest-linux-x86_64.sh-XXXXXXXXXX)
MINICONDA_DOWNLOAD_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
NOW=$(date +"%Y-%m-%d %H:%M:S")

A=1   # current step-number
B=12  # total number of steps


check_64bit () {
  ARCHITECTURE=$(uname -m)

  if [[ "$ARCHITECTURE" == "x86_64" ]]; then
      :  # pass in bash
  else
      echo -e "Architecture $ARCHITECTURE not supported. We expect x86_64"
  fi
}


check_required_executables() {
    check_ok

    MISSING=false
    REQUIRED_EXECUTABLES=(curl git bash)
    echo -e ""
    for EXECUTABLE in "${REQUIRED_EXECUTABLES[@]}"; do
        if hash "$EXECUTABLE" 2>/dev/null; then
            :  # pass in bash
        else
            echo -e "Executable $EXECUTABLE not found on PATH."
            MISSING=true
        fi
    done

    if ${MISSING}; then
        echo -e "Please make sure the required executables are available in the system."
        echo -e ""
        exit 1
    fi
}


check_args() {
    check_ok
    if [[ "$#" -eq 0 ]]; then
        echo -e "You provided an incorrect number of arguments: $@"
        echo -e "Usage:"
        echo -e "    $HOME/bin/install-miniconda.sh <path-miniconda-installation>"
        echo -e "Example:"
        echo -e "    $HOME/bin/install-miniconda.sh $HOME/miniconda"
        exit 1
    fi
    PREFIX=$(realpath -s "$1")
}


check_for_active_conda_env() {
    check_ok
    if [[ -n "$CONDA_PREFIX" ]]; then
        echo -e ""
        echo -e "The env-variable CONDA_PREFIX has been set to value $CONDA_PREFIX"
        echo -e "This means you are working in some activated conda-environment. "
        echo -e "Please de-activate this environment, and try again."
        echo -e "To de-activate:"
        echo -e "    >>> source deactivate"
        echo -e "or:"
        echo -e "    >>> conda deactivate"
        echo -e ""
        exit 1
    fi
}


check_path() {
    check_ok

    if [[ -d "$PREFIX" ]] && [[ "$(ls -A "$PREFIX")" ]]; then
        echo -e ""
        echo -e "The directory $PREFIX already exists, and is NOT empty."
        echo -e "To avoid installing in an unclean environment, please choose a different location,"
        echo -e "or cleanup/rename/remove this directory first."
        echo -e ""
        exit 1
    fi

    if [[ -d "$PREFIX" ]] && [[ ! "$(ls -A "$PREFIX")" ]]; then
        echo -e ""
        echo -e "The directory $PREFIX already exists, but is empty. Let's continue."
    fi
}


create_prefix_dir() {
    check_ok

    if [[ -d "$PREFIX" ]]; then
        echo -e "\nStep $A/$B: Directory $PREFIX already exists."
    else
        echo -e "\nStep $A/$B: Creating new directory $PREFIX."
        mkdir -p "$PREFIX"
    fi
    ((A=A+1))

}


create_dir_home_bin(){
    check_ok
    BIN_DIR="$HOME/bin"

    if [[ -d "$BIN_DIR" ]]; then
        echo -e "\nStep $A/$B: Directory $BIN_DIR already exists."
    else
        echo -e "\nStep $A/$B: Creating new directory $BIN_DIR."
        mkdir -p "$BIN_DIR"
    fi
    ((A=A+1))

}


download_miniconda() {
    check_ok
    echo -e "\nStep $A/$B: Downloading miniconda-installer for 64bit-linux in $MINICONDA_INSTALLER."
    echo -e "This might take a while.\n"
    # curl --insecure "$MINICONDA_DOWNLOAD_URL" --output "$MINICONDA_INSTALLER"
    curl "$MINICONDA_DOWNLOAD_URL" --output "$MINICONDA_INSTALLER"
    ((A=A+1))

}


install_miniconda() {
    check_ok
    echo -e "\nStep $A/$B: Installing miniconda in $PREFIX"
    chmod u+x "$MINICONDA_INSTALLER"
    bash "$MINICONDA_INSTALLER" -b -u -p "$PREFIX"
    mv "$MINICONDA_INSTALLER" "$PREFIX/bin/miniconda3-latest-linux-x86_64.sh"
    ((A=A+1))

}


create_condarc(){
    check_ok
    echo -e "\nStep $A/$B: Generating $PREFIX/condarc"
    ((A=A+1))

   # do not quote END_OF_FILE to allow variable-substitution
   cat > "$PREFIX/condarc" << END_OF_FILE
# This is a comment.
# For more information about this file see:
# https://conda.io/docs/user-guide/configuration/use-condarc.html

channels:
    - defaults
    - conda-forge

ssl_verify: false

auto_update_conda: False

always_yes: False

envs_dirs:
    - ${PREFIX}/envs

pkgs_dirs:
    - ${PREFIX}/var/cache

END_OF_FILE
}


create_pip_config() {
    check_ok
    echo -e "\nStep $A/$B: Generating $PREFIX/pip.conf"
    ((A=A+1))

    echo -e "\tCreating cache-dir $PREFIX/var/cache-pip"
    mkdir -p "$PREFIX/var/cache-pip"

   # do not quote END_OF_FILE to allow variable-substitution
   cat > "$PREFIX/pip.conf" << END_OF_FILE
# This is a comment.
#
# For more information, please see:
#   - http://docs.python-guide.org/en/latest/dev/pip-virtualenv/
#   - https://pip.pypa.io/en/stable/user_guide/#config-file
#
# Config-files can be located in:
#   - /etc/pip.conf
#   - ~/.config/pip/pip.conf (~/./pip/pip.conf is deprecated)
#   - ${PREFIX}/envs/<env-name>/pip.conf

[global]
# index = https://nexus..../repository/pypi-all/pypi
# index-url = https://nexus.../repository/pypi-all/simple
# extra-index-url = https://pypi.org/simple

# find-links = https://gdcmaacap803/packages/

# cfr. https://github.com/pypa/pip/issues/2850
cache-dir = ${PREFIX}/var/cache-pip

timeout = 30

trusted-host =
    pypi.org
    files.pythonhosted.org

[freeze]
timeout = 10
END_OF_FILE
}


#create_symlinks(){  # too naive implementation
#    check_ok
#    echo -e "\nStep $1/$2: Creating symlinks in $HOME/bin/conda"
#    FILES=(conda conda-env activate deactivate)
#    for F in "${FILES[@]}"; do
#        echo -e "          Creating symlink $HOME/bin/$F,\tpointing to $PREFIX/bin/$F"
#        ln -sf $PREFIX/bin/$F $HOME/bin
#    done
#}

create_safe_symlinks(){
    check_ok
    echo -e "\nStep $A/$B: Creating symlinks in $HOME/bin/"
    ((A=A+1))
    FILES=("conda" "conda-env" "activate" "deactivate", "mamba", "mamba-package")

    for F in "${FILES[@]}"; do

        TARGET_FILENAME="$HOME/bin/$F"   # /home/<user>/bin/foo.sh

        if [[ ! -f "$TARGET_FILENAME" ]] ; then
            # if the target-symlink does not yet exist, just create it.
            echo -e "          Creating symlink $TARGET_FILENAME, pointing to $PREFIX/bin/$F"
            ln -sf "$PREFIX/bin/$F" "$TARGET_FILENAME"
            continue

        else
            # if the target-symlink does already exist, do not overwrite, pick another available symlink-name
            TARGET_DIR=$(dirname "$TARGET_FILENAME")       # /home/<user>/bin/
            BASENAME=$(basename -- "$TARGET_FILENAME")     # foo.sh
            EXT="${BASENAME##*}"         # .sh

            # cfr https://unix.stackexchange.com/questions/253524/dirname-and-basename-vs-parameter-expansion
            case ${BASENAME##*/} in
                (?*.*) EXT=".${BASENAME##*.}";;  # foo.xyz
                (*) EXT="";;                       # foo, without extension
            esac

            BASENAME="${BASENAME%.*}"            # foo.

            i=""
            if [[ -e ${TARGET_DIR}/${BASENAME}${EXT} ]] ; then
                i=2
                while [[ -e ${TARGET_DIR}/${BASENAME}-${i}${EXT} ]] ; do
#                    echo -e "          There already exists a file $TARGET_DIR/$fBASENAME-$i$EXT"
                    (( i++ ))
                done
            fi
            NEW_TARGET=${TARGET_DIR}/${BASENAME}-${i}${EXT}
            echo -e "          Found pre-existing symlink $TARGET_FILENAME"
            echo -e "          Creating symlink $NEW_TARGET, pointing to $PREFIX/bin/$F"
            echo -e ""
            ln -sf "$PREFIX/bin/$F" "$NEW_TARGET"

        fi

    done
}


update_conda_itself() {
    check_ok
    echo -e "\nStep $A/$B: Updating the conda-package itself via 'conda update -n base -c defaults conda'"
    "$PREFIX/bin/conda" update -n base -c defaults conda --yes
    ((A=A+1))
}


update_conda_packages() {
    check_ok
    echo -e "\nStep $A/$B: Updating the other conda-packages via 'conda update --all'"
    "$PREFIX/bin/conda" update --all --yes
    ((A=A+1))
}


install_conda_packages() {
    check_ok
    echo -e "\nStep $A/$B: Installing conda-packages in the base-environment"
    "$PREFIX/bin/conda" install conda-build --name base --yes
    "$PREFIX/bin/conda" install mamba --name base --channel conda-forge --yes
    ((A=A+1))
}

copy_helper_scripts() {
    check_ok
    echo -e "\nStep $A/$B: Copying helper-scripts from $CANONICAL_SCRIPT_DIR to $HOME/bin/"
    ((A=A+1))

    SCRIPTS=(create-miniconda-env.sh)
    for SCRIPT in "${SCRIPTS[@]}"; do

        if [[ -f "$SCRIPT" ]]; then
            echo -e "          Copy script to $HOME/bin/$SCRIPT"
            cp -b "$CANONICAL_SCRIPT_DIR/$SCRIPT" "$HOME/bin/"
        else
            echo -e "          $SCRIPT not present.Cannot copy to $HOME/bin/"
        fi

    done
}


add_to_bashrc() {
    echo -e ""
    echo -e "Step $A/$B: Adding following to ~/.bashrc:"
    echo -e "\texport MINICONDA_PREFIX=\"$PREFIX\""
    echo -e "\talias sa=\"source $PREFIX/bin/activate\""
    echo -e "\talias sd=\"source $PREFIX/bin/deactivate\""

    {
        echo -e ""
        echo -e "# miniconda - set by install-miniconda.sh-script"
        echo -e "export MINICONDA_PREFIX=\"$PREFIX\""
        echo -e "alias sa=\"source $PREFIX/bin/activate\"   # could shadow /usr/sbin/sa"
        echo -e "alias sd=\"source $PREFIX/bin/deactivate\""
    } >> ~/.bashrc
    ((A=A+1))

}


print_final_message() {
    echo -e ""
    echo -e ""
    echo -e "It seems you successfully finished all steps."
    echo -e ""
    echo -e "Please execute following command before executing the next install-script:"
    echo -e "    >>> export MINICONDA_PREFIX=$PREFIX"
    echo -e "\n\n"
}


check_ok() {
    if [[ "$?" -ne "0" ]]; then
        echo -e ""
        echo -e "There were some failures, please check the output above."
        exit $?
    fi
}


# start main-script
trap check_ok EXIT

echo -e "Start installing miniconda $PREFIX on $NOW\n"
check_64bit
check_required_executables
check_args "$@"
check_for_active_conda_env
check_path
create_prefix_dir
create_dir_home_bin
download_miniconda
install_miniconda
create_condarc
create_pip_config
create_safe_symlinks
update_conda_itself
update_conda_packages
install_conda_packages
copy_helper_scripts
add_to_bashrc
print_final_message
