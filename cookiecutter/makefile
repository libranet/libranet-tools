# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

PYTHON_VERSION=`~/bin/pyenv versions --bare |grep '3.11'`


.PHONY: install
install: create-venv create-dirs upgrade-pip install-packages install-symlinks


.PHONY: create-venv
create-venv:
	- PYENV_VERSION=${PYTHON_VERSION} python -m venv .


.PHONY: create-dirs
create-dirs:
	- mkdir -p etc
	- mkdir -p var


.PHONY: upgrade-pip
install:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	- bin/pip install glances


.PHONY: install-symlinks
install-symlinks:
	@echo -e "Create symlink in ${HOME}/bin/cookiecutter"
	-APP_PATH:=$(realpath bin/cookiecutter) && \
	cd ~/bin && ln -sf ${APP_PATH} cookiecutter

