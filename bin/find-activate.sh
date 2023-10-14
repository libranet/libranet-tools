#!/bin/bash


function find_activate {
    #!/bin/bash
    # cfr https://unix.stackexchange.com/questions/6463/find-searching-in-parent-directories-instead-of-subdirectories

    VENV_DIR=".venv"

    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$VENV_DIR" ]]; do
      path=${path%/*}
    done

    ACTIVATE_FILE="$path/$VENV_DIR/bin/activate"

    if [ -f "$ACTIVATE_FILE" ]; then
        echo "$ACTIVATE_FILE"
        # You cannot source withing a shell-script to make it available outside
        # You must create an alias in ~/.aliasrc
        # source $ACTIVATE_FILE
    else
        echo -e "Cannot find activate-file $ACTIVATE_FILE."
    fi
}

find_activate