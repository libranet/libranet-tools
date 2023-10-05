# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# PYTHON_VERSION=`~/bin/pyenv versions --bare |grep '3.11'| tail -n 1`
PYTHON_VERSION=$(python -V | awk '{print $2}')

CMD=$(realpath bin/ansible)
BIN_DIR=$(realpath bin/)



.PHONY: clean
clean:
	- rm -fr bin include lib lib64 pyvenv.cfg
	- rm -fr var


.PHONY: install
install: create-dirs create-venv upgrade-pip install-packages install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-dirs
create-dirs:
	- mkdir -p var/home
	- mkdir -p var/cache
	- mkdir -p var/tmp


.PHONY: create-venv
create-venv:
	- PYENV_VERSION=${PYTHON_VERSION} python -m venv .


.PHONY: upgrade-pip
install:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	- bin/pip install --upgrade ansible autoread-dotenv


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${BIN_DIR}/ansible
	@ cd ~/bin && ln -sf ${BIN_DIR}/ansible-community
	@ cd ~/bin && ln -sf ${BIN_DIR}/ansible-config
	@ cd ~/bin && ln -sf ${BIN_DIR}/ansible-connection
	@ cd ~/bin && ln -sf ${BIN_DIR}/ansible-console
	@ cd ~/bin && ln -sf ${BIN_DIR}/ansible-doc
	@ cd ~/bin && ln -sf ${BIN_DIR}/ansible-galaxy
	@ cd ~/bin && ln -sf ${BIN_DIR}/ansible-inventory
	@ cd ~/bin && ln -sf ${BIN_DIR}/ansible-playbook
	@ cd ~/bin && ln -sf ${BIN_DIR}/ansible-pull
	@ cd ~/bin && ln -sf ${BIN_DIR}/ansible-test
	@ cd ~/bin && ln -sf ${BIN_DIR}/ansible-vault
