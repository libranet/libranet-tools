# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.
#
# https://github.com/aristocratos/bpytop
# https://www.cyberciti.biz/open-source/command-line-hacks/bpytop-awesome-linux-macos-and-freebsd-resource-monitor/

CMD=$(realpath bin/bpytop)

TOOLS_DIR ?= ${HOME}
BIN_DIR = ${TOOLS_DIR}/bin

.PHONY: clean
clean:
	@ rm -fr bin include lib lib64 pyvenv.cfg
	@ rm -fr var


.PHONY: install
install: create-dirs create-venv upgrade-pip install-packages install-symlinks


.PHONY: update
update: upgrade-pip install-packages


.PHONY: create-dirs
create-dirs:
	@ mkdir -p etc
	@ mkdir -p etc/themes
	@ mkdir -p var/cache
	@ mkdir -p var/log


.PHONY: create-venv
create-venv:
	- python3 -m venv .


.PHONY: upgrade-pip
install:
	- bin/python -m pip install --upgrade pip


.PHONY: install-packages
install-packages:
	- bin/pip install --upgrade bpytop


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlinking ${CMD} to ${BIN_DIR}"
	@ cd ${BIN_DIR} && ln -sf ${CMD} bpytop
	@ cd ${BIN_DIR} && ln -sf ${CMD} btop
	@ ln -sf ~/.config/bpytop etc
