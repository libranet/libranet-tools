
function find_envname {
    #  VIRTUAL_ENV=/opt/envs/<project-name>/.venv
    # dirname VIRTUAL_ENV -> /opt/envs/<project-name>
    # basename dirname  VIRTUAL_ENV -> <project-name>
    ENV_NAME=`basename $(dirname $VIRTUAL_ENV)`
    echo "$ENV_NAME"
}

find_envname