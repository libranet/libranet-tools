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
	# keep var/projects
	@ rm -fr bin
	@ rm -fr var/tmp


.PHONY: install
install: create-dirs download-installer run-installer install-symlinks version


.PHONY: update
update:
	bin/edgedb cli upgrade


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/projects/demo
	@ mkdir -p var/tmp


.PHONY: download-installer
download-installer:
	@ curl --proto '=https' --tlsv1.2 -sSf https://sh.edgedb.com > bin/install-edgedb.sh
	@ chmod u+x bin/install-edgedb.sh


.PHONY: run-installer
run-installer:
	bin/install-edgedb.sh -y --no-modify-path --verbose
	cd bin && ln -s ~/.local/bin/edgedb && cd -
	# - mv ~/.local/bin/edgedb bin/


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath bin/edgedb) to ${HOME}/bin/"
	cd ~/bin && ln -sf $(realpath bin/edgedb)


.PHONY: version
version:
	@ echo -e "\nCurrent version is:"
	bin/edgedb --version


project-init:
	bin/edgedb project init --project-dir var/projects/demo
