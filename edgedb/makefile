# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

.ONESHELL:
.NOTPARALLEL:
.PHONY: all

export TMPDIR := $(realpath var/tmp)
# export TMP := $(realpath var/tmp)
# export TEMP := $(realpath var/tmp)


.PHONY: clean
clean:
	@ rm -fr bin
	@ rm -fr var


.PHONY: install
install: create-dirs download-installer run-installer install-symlinks


.PHONY: update
update:
	bin/edgedb cli upgrade


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/project
	@ mkdir -p var/tmp


.PHONY: download-installer
download-installer:
	- curl --proto '=https' --tlsv1.2 -sSf https://sh.edgedb.com > bin/install-edgedb.sh
	@ chmod u+x bin/install-edgedb.sh


.PHONY: run-installer
run-installer:
	- bin/install-edgedb.sh -y --no-modify-path --verbose
	- mv ~/.local/bin/edgedb bin/


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath bin/edgedb) to ${HOME}/bin/"
	- cd ~/bin && ln -sf $(realpath bin/edgedb)


.PHONY: check
check:
	@ echo -e "\nCurrent version is:"
	- bin/edgedb --version


project-init:
	bin/edgedb project init --project-dir var/project
