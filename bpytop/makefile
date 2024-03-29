# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.
#
# https://github.com/aristocratos/bpytop
# https://www.cyberciti.biz/open-source/command-line-hacks/bpytop-awesome-linux-macos-and-freebsd-resource-monitor/

MAKEFLAGS += --always-make --warn-undefined-variables
.DEFAULT_GOAL := help # Set default goal to not be dependent on sorting / ordering.
.NOTPARALLEL:
.ONESHELL:  # all lines of the recipe will be given to a single invocation of the shell

TOOLS_DIR ?= ${HOME}
BIN_DIR = ${TOOLS_DIR}/bin

help:  #? display this help information
	@ grep "^#?" makefile | cut -c 4-
	@ echo -e "\nThis help is generated by parsing the inline comments."
	@ echo -e "Please use \`make <target>' where <target> is one of:\n"
	@ grep -E '^[a-zA-Z_-]+:.*?#?.*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?#\\? "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

clean:  #? remove generated files & dirs
	@ rm -fr bin include lib lib64 pyvenv.cfg
	@ rm -fr var

install: create-dirs create-venv upgrade-pip install-packages install-symlinks version  #? run all install-steps

update: upgrade-pip install-packages version #? update the current installation

create-dirs:  #? create files and directories
	@ mkdir -p etc
	@ mkdir -p etc/themes
	@ mkdir -p var/cache
	@ mkdir -p var/log

create-venv: #? create a virtual python-environment
	python3 -m venv .

upgrade-pip:  #? upgrade pip itself
	bin/python -m pip install --upgrade pip

install-packages:  #? install python-packages via pip
	bin/pip install --upgrade bpytop

install-symlinks:  #? generate symlinks
	@ echo -e "Symlinking to ${BIN_DIR}"
	cd ${BIN_DIR} && ln -sf $(realpath bin/bpytop) bpytop && cd -
	@ cd ${BIN_DIR} && ln -sf $(realpath bin/bpytop) btop && cd -
	@ ln -sf ~/.config/bpytop

version:  #? show current version
	@ echo -e "\nCurrent version is:"
	@ bin/bpytop --version