# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.
#
# https://github.com/aristocratos/bpytop
# https://www.cyberciti.biz/open-source/command-line-hacks/bpytop-awesome-linux-macos-and-freebsd-resource-monitor/

CMD=$(realpath bin/bpytop)
PYTHON_VERSION=`pyenv versions --bare |grep '3.11' | tail -n 1`


.PHONY: clean
clean:
	- rm -fr bin include lib lib64 pyvenv.cfg


.PHONY: install
install: create-venv upgrade-pip install-packages install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-venv
create-venv:
	- PYENV_VERSION=${PYTHON_VERSION} python -m venv .

.PHONY: create-dirs
create-dirs:
	- mkdir -p etc
	- mkdir -p etc/themes
	- mkdir -p var

.PHONY: upgrade-pip
install:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	- bin/pip install --upgrade bpytop


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink ${CMD} to ${HOME}/bin/"
	@ cd ~/bin && ln -sf ${CMD}
	- ln -s ~/.config/bpytop etc
