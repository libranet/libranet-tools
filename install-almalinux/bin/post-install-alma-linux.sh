#!/bin/bash
# This bash-script installs miniconda in the directory you provide
set -x  # enable for verbose output
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e




check_ok() {
    if [[ "$?" -ne "0" ]]; then
        echo -e ""
        echo -e "There were some failures, please check the output above."
        exit $?
    fi
}


update_system(){
    sudo dnf check-update && sudo dnf update -y
}


add_epel_repo(){
    # https://www.linuxcapable.com/how-to-install-enable-epel-epel-next-on-almalinux-9/
    sudo dnf upgrade --refresh -y
    sudo dnf config-manager --set-enabled crb
    sudo dnf install -y \
        https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
        https://dl.fedoraproject.org/pub/epel/epel-next-release-latest-9.noarch.rpm
}


set_ulimits() {
    # needed to neo4j locally
    LIMITS="/etc/security/limits.conf"
    GROUPNAME='wheel'
    echo -e "\nAppending config for group \"$GROUPNAME\" to $LIMITS.\n"
    echo -e "\n\n" | sudo tee -a $LIMITS
    echo -e "# Setting config for neo4j, cfr. https://neo4j.com/docs/1.6.2/configuration-linux-notes.html" | sudo tee -a $LIMITS
    line1="@$GROUPNAME hard nofile 40000"
    line2="@$GROUPNAME soft nofile 40000"
    echo -e $line1 | sudo tee -a $LIMITS
    echo -e $line2 | sudo tee -a $LIMITS
    echo "" | sudo tee $LIMITS
}


install_rpm(){
    # https://github.com/pyenv/pyenv/wiki#suggested-build-environment
    sudo dnf makecache
    sudo dnf -y update
    sudo dnf -y install \
        bzip2 \
        bzip2-devel \
        libffi-devel \
        libuuid-devel \
        ncurses-devel \
        openssl-devel \
        readline-devel \
        sqlite \
        sqlite-devel \
        tk-devel \
        xz-devel \
        zlib-devel \
        bash-completion \
        crontabs \
        curl \
        gcc \
        gcc-c++ \
        git \
        git-lfs \
        golang \
        htop \
        initscripts \
        iotop \
        libxcrypt-compat \
        mailcap \
        make \
        net-tools \
        nfs-utils \
        postgresql \
        postgresql-devel \
        psmisc \
        screen \
        strace \
        telnet \
        tmux \
        yum-utils \
        vim \
        wget \
        unzip \
        util-linux-user \
        autojump \
        autojump-zsh
        # llvm  lzma-sdk-devel libyaml-devel redhat-rpm-config
}


install_zsh(){
    sudo dnf -y install zsh
    mkdir -p ~/.config/zsh
    mkdir -p ~/.cache/zsh
    # see https://www.reddit.com/r/zsh/comments/3ubrdr/proper_way_to_set_zdotdir/
    echo 'ZDOTDIR=$HOME/.config/zsh' >> ~/.zshenv

    echo -e "Switching default shell from bash to zsh for user $USER"
    sudo chsh -s /bin/zsh  $USER
}


set_passwordless_sudo(){   # not needed on alma-linux
    # passwordless sudo for all users
    sudo echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
}


setup_docker_group() {
    # avoid error: "Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock"
    # see https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket
    sudo groupadd --force docker
    sudo usermod -aG docker ${USER}
}


create_dir_home_bin(){
    # check_ok
    BIN_DIR="$HOME/bin"

    if [[ -d "$BIN_DIR" ]]; then
        echo -e "\nStep $A/$B: Directory $BIN_DIR already exists."
    else
        echo -e "\nStep $A/$B: Creating new directory $BIN_DIR."
        mkdir -p "$BIN_DIR"
    fi
    ((A=A+1))
}


create_project_dirs(){
    # where to put our projects? Personally I avoid $HOME
    sudo mkdir -p /opt/envs /opt/repo /opt/tools
    sudo chown $USER:$USER /opt/envs /opt/repo /opt/tools
    ln -s /opt/envs $HOME
    ln -s /opt/repo $HOME
}


install_pyenv(){
    # PYENV_ROOT=~/.pyenv
    export PYENV_ROOT=~/.local/share/pyenv
    mkdir -p ~/.local/share

    echo -e "Start installing pyenv in $PYENV_ROOT."

    # install pyenv
    curl https://pyenv.run | bash

    # symlink pyenv-executable in ~/bin
    cd  ~/bin && ln -s ~/.local/share/pyenv/libexec/pyenv pyenv && cd -

    # update pyenv
    ~/bin/pyenv update

    # add initialisating to your .bashrc
    # see https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
    echo '' >> ~/.bashrc
    echo '' >> ~/.bashrc
    echo 'export PYENV_ROOT="$HOME/.local/share/pyenv"' >> ~/.bashrc
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc

    # add to .zshrc
    echo '' >>  ~/.zshrc
    echo '' >>  ~/.zshrc
    echo 'export PYENV_ROOT="$HOME/.local/share/pyenv"' >> ~/.zshrc
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc
}


install_python() {
    # install all recent major python-versions
    # ~/bin/pyenv install 3.8:latest
    ~/bin/pyenv install 3.9:latest
    ~/bin/pyenv install 3.10:latest
    ~/bin/pyenv install 3.11:latest

    # V38=`~/bin/pyenv versions --bare |grep '3.8'`
    V39=`~/bin/pyenv versions --bare |grep '3.9'`
    V310=`~/bin/pyenv versions --bare |grep '3.10'`
    V311=`~/bin/pyenv versions --bare |grep '3.11'`

    # set global python
     ~/bin/pyenv global ${V39} ${V310} ${V311}
}


install_poetry(){
    # install poetry
    curl -sSL https://install.python-poetry.org | python3 -

    # symlink poetry-executable in ~/bin
    cd ~/bin && ln -s ~/.local/share/pypoetry/venv/bin/poetry poetry && cd -
    ~/bin/poetry self update
}


install_terraform(){
    # install gpg-key
    # curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    # sudo dnf check-update
    # add hashicorp-repository
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    sudo dnf -y install terraform
    # install
    terraform -install-autocomplete  2> /dev/null
}

install_terraform_docs(){
    # available releases: https://github.com/terraform-docs/terraform-docs/tags
    go install github.com/terraform-docs/terraform-docs@v0.16.0
}


install_azure_cli(){
    # install azure cli
    # see https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=dnf
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo dnf install -y https://packages.microsoft.com/config/rhel/9/packages-microsoft-prod.rpm
    sudo dnf install -y azure-cli
    az upgrade
    az config set auto-upgrade.enable=yes
}


install_oh_my_posh(){
    # avoid files like ~/omp.cache because cache-dir did not exist.
    mkdir -p ~/.cache/oh-my-posh

    # install executable
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O ~/bin/oh-my-posh
    chmod u+x ~/bin/oh-my-posh

    # install themes
    mkdir -p ~/.local/share/poshthemes
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O  ~/.local/share/poshthemes/themes.zip
    unzip  ~/.local/share/poshthemes/themes.zip -d  ~/.local/share/poshthemes
    chmod u+rw ~/.local/share/poshthemes/*.omp.*
    rm ~/.local/share/poshthemes/themes.zip

    # enable in bash / zsh
    echo '' >>  ~/.bashrc
    echo '' >>  ~/.bashrc
    echo 'eval "$(oh-my-posh init bash --config ~/.local/share/poshthemes/jandedobbeleer.omp.json)"'  >> ~/.bashrc

    echo '' >>  ~/.zshrc
    echo '' >>  ~/.zshrc
    echo 'eval "$(oh-my-posh init zsh --config ~/.local/share/poshthemes/jandedobbeleer.omp.json)"'  >> ~/.zshrc


    curl -L git.io/antigen > antigen.zsh

}

# install_docker_compose(){
#     # install docker-compose v2, bevause Docker Desktop ships with docker-compose v1
#     wget https://github.com/docker/compose/releases/download/v2.9.0/docker-compose-linux-x86_64 -O /tmp/docker-compose
#     # make executable
#     chmod u+x  /tmp/docker-compose
#     # move to bin-directory available on $PATH
#     mv /tmp/docker-compose  ~/bin/
# }


install_sonar_scanner_cli(){
    # install sonar-scanner-cli
    # find downlods-urls on https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/
    # mkdir -p ~/.local/share/sonar-scanner-cli
    sudo mkdir -p /opt/tools/sonar-scanner-cli
    sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip  -O /opt/tools/sonar-scanner-cli-4.7.0.2747-linux.zip
    sudo unzip sonar-scanner-cli-4.7.0.2747-linux.zip
    sudo mv sonar-scanner-cli-4.7.0.2747-linux 4.7.0
    cd ~/bin
    ln -sf /opt/tools/sonar/4.7.0/bin/sonar-scanner
    ln -sf /opt/tools/sonar/4.7.0/bin/sonar-scanner-debug
}



print_final_message() {
    echo -e ""
    echo -e ""
    echo -e "It seems you succesfully finished all steps."
    echo -e ""
    echo -e "\n\n"
}


# start main-script
# trap check_ok EXIT

# update_system
# add_epel_repo
# set_ulimits
# set_passwordless_sudo
# setup_docker_group
# install_rpm
# create_dir_home_bin
# create_project_dirs
# install_terraform
# install_terraform_docs
# install_azure_cli

# install_pyenv
# install_python
# install_poetry
install_oh_my_posh

# install_docker_compose  # no longer needed
# install_sonar_scanner_cli
