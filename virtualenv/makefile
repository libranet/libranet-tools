# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

PYTHON_VERSION=`~/bin/pyenv versions --bare |grep '3.11' | tail -n 1`
CMD=$(realpath bin/virtualenv)


.PHONY: clean
clean:
	- rm -fr bin include lib lib64 pyvenv.cfg


.PHONY: install
install: create-venv create-dirs upgrade-pip install-packages install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-venv
create-venv:
	- PYENV_VERSION=${PYTHON_VERSION} python -m venv .


.PHONY: create-dirs
create-dirs:
	- mkdir -p var/cache


.PHONY: upgrade-pip
install:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	- bin/pip install --upgrade virtualenv autoread-dotenv


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}
