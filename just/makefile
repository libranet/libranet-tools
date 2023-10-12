# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

.ONSHELL:

TMPDIR := $(realpath var/tmp)


.PHONY: clean
clean:
	@ rm -fr bin
	@ rm -fr var


.PHONY: install
install: create-dirs download-installer run-installer install-symlinks


.PHONY: update
update: install


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/tmp


.PHONY: download-installer
download-installer:
	#- curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/bin
	- curl -sSLf https://just.systems/install.sh > bin/install-just.sh
	@ chmod u+x bin/install-just.sh


.PHONY: run-installer
run-installer:
	- bin/install-just.sh --to $(realpath bin) --target $(realpath var)


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath bin/just) to ${HOME}/bin/"
	- cd ~/bin && ln -sf $(realpath bin/just)


.PHONY: check
check:
	@ echo -e "\nCurrent version is:"
	- bin/just --version
