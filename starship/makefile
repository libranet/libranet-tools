# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.

.ONSHELL:

TMPDIR := $(realpath var/tmp)

.PHONY: clean
clean:
	@ rm -fr bin
	@ rm -fr var


.PHONY: install
install: create-dirs download-installer run-installer install-symlinks version


.PHONY: update
update: install


.PHONY: create-dirs
create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/cache
	@ mkdir -p var/tmp


.PHONY: download-installer
download-installer:
	curl -sSLf https://starship.rs/install.sh > bin/install-starship.sh
	chmod u+x bin/install-starship.sh


.PHONY: run-installer
run-installer:
	bin/install-starship.sh --bin-dir bin --yes --verbose


.PHONY: install-symlinks
install-symlinks:
	@ echo -e "Symlink $(realpath bin/starhip) to ${HOME}/bin/"
	cd ~/bin && ln -sf $(realpath bin/starship)


version:
version:
	@ echo -e "\nCurrent version is:"
	@ bin/starship --version
