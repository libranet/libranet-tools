# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

# see https://github.com/pdm-project/awesome-pdm

PYTHON_VERSION=`~/bin/pyenv versions --bare |grep '3.11' | tail -n 1`
CMD=$(realpath bin/pdm)


.PHONY: install
install: create-venv upgrade-pip install-packages install-symlinks


.PHONY: update
update: upgrade-pip install-packages poetry-update


.PHONY: create-venv
create-venv:
	- PYENV_VERSION=${PYTHON_VERSION} python -m venv .


.PHONY: upgrade-pip
install:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	- bin/pip install --upgrade pdm


.PHONY: poetry-update
poetry-update:
	- bin/pdm self update


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}
