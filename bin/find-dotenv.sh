#!/bin/bash


function find_dotenv {
    #!/bin/bash
    # cfr https://unix.stackexchange.com/questions/6463/find-searching-in-parent-directories-instead-of-subdirectories

    DOTENV=".env"

    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$DOTENV" ]]; do
      path=${path%/*}
    done


    DOTENV_FILE="$path/$DOTENV"

    if [ -f "$DOTENV_FILE" ]; then
        echo "$DOTENV_FILE"
    else
        echo -e "Cannot find dotenv-file $DOTENV_FILE."
    fi
}

find_dotenv