# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

CMD=$(realpath bin/pipx)
PYTHON_VERSION=`pyenv versions --bare |grep '3.11' | tail -n 1`


.PHONY: clean
clean:
	rm -fr bin include lib lib64 pyvenv.cfg


.PHONY: install
install: create-dirs create-venv upgrade-pip install-packages install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-dirs
create-dirs:
	@ mkdir -p var/cache
	@ mkdir -p var/tmp


.PHONY: create-venv
create-venv:
	- PYENV_VERSION=${PYTHON_VERSION} python -m venv .


.PHONY: upgrade-pip
install:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	- bin/pip install --upgrade pipx


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}
