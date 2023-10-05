# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

.ONSHELL:

# TMPDIR := var/tmp

.PHONY: clean
clean:
	- rm -fr bin
	- rm -fr var


.PHONY: install
install: create-dirs download-installer run-installer install-symlinks 


.PHONY: update
update: install


.PHONY: create-dirs
create-dirs:
	- mkdir -p bin
	- mkdir -p var/tmp


.PHONY: download-installer
download-installer:
	- curl -sS https://starship.rs/install.sh > bin/install-starship.sh 
	- chmod u+x bin/install-starship.sh


.PHONY: run-installer
run-installer:
	TMPDIR := $(shell readlink -f var/tmp)
	- echo "Using TMPDIR: $(TMPDIR)"
	- bin/install-starship.sh --bin-dir bin --yes --verbose
	

.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath bin/starhip) to ${HOME}/bin/"
	- cd ~/bin && ln -sf $(realpath bin/starship)

