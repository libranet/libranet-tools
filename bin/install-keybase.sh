# see https://keybase.io/docs/the_app/install_linux
#

export GNUPGHOME="$HOME/.config/gnupg"
export GPG_TTY=$(tty)

function update_rpms() {
    echo -e "Install rpm-packages for gpg & keybase."
    sudo dnf install -y gnupg2
    sudo dnf install -y pinentry pinentry-tty
    sudo dnf install -y https://prerelease.keybase.io/keybase_amd64.rpm
}

function create_gnupg_config() {
    echo -e "Creating \$GNUPGHOME in ${GNUPGHOME}."
    mkdir -p ${GNUPGHOME}
    chmod 700 ${GNUPGHOME}
}

function import_gpg_from_keybase() {
    # export public + private gpg-key from keybase into local gpg-instance

    echo -e "Export public gpg-key from keybase.io."
    keybase pgp export | gpg --import

    echo -e "Export private gpg-key from keybase.io."
    keybase pgp export --secret | gpg --allow-secret-key --import

    gpg --list-secret-keys
}

function configure_git() {
    KEY_ID = $(gpg --list-keys --keyid-format long | awk '/pub/ {print $2}' | cut -c 17-30)
    git config --global user.signingkey ${KEY_ID}
    git config --global commit.gpgsign true
}

# main program
install_rpm
create_gnupg_config
import_gpg_from_keybase
configure_git
