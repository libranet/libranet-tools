# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

PYTHON_VERSION=`~/bin/pyenv versions --bare |grep '3.11' | tail -n 1`
# PYTHON_VERSION=3.11.2


.PHONY: install
install: create-venv create-dirs upgrade-pip install-packages install-symlinks


.PHONY: update
update: upgrade-pip install-packages


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
	- bin/pip install --upgrade cookiecutter cruft


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath bin/cookiecutter) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/cookiecutter)

	@ echo -e "Symlink $(realpath bin/cruft) to ${HOME}/bin/"
	@ cd ~/bin && ln -sf $(realpath bin/cruft)
