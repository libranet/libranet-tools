

# create a new python-venv in {{directory}} with python {{python}
uv-create-venv directory=".venv" python="3.9":
    #!/usr/bin/env bash
    # set -euxo pipefail
    set -euo pipefail

    # Check if VIRTUAL_ENV is set
    if [[ -n "${VIRTUAL_ENV:-}" ]]; then
        # Unset the VIRTUAL_ENV environment variable
        unset VIRTUAL_ENV
        echo "VIRTUAL_ENV was set and has been unset."
    fi

    # Check if the directory name ends with ".venv"
    if [[ {{directory}} != *.venv ]]; then
        # If it doesn't end with ".venv", append it
        venv_dir="{{directory}}/.venv"
    else
        venv_dir="{{directory}}"
    fi

    uv venv $venv_dir --python={{python}} --seed
    cd $venv_dir/..
    ln -rsf .venv/bin
    ln -rsf .venv/lib
    ln -rsf .venv/pyvenv.cfg
    cd -
